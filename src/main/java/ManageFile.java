import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;

public class ManageFile {

    public static void createExcelFile(Map<String, Legend> legendsData) throws IOException {

        XSSFWorkbook workbook = new XSSFWorkbook();
        XSSFSheet sheet = workbook.createSheet("Legends.xlsx");

        int rowCount = 0;
        for (Map.Entry<String, Legend> el : legendsData.entrySet())
        {
            Row row = sheet.createRow(rowCount++);

            ArrayList<String> legend = el.getValue().createArrayList();
            int cellnum = 0;
            for (String x : legend)
            {
                Cell cell = row.createCell(cellnum++);
                cell.setCellValue(x);
            }
        }
        try
        {
            FileOutputStream out = new FileOutputStream(new File("Legends.xlsx"));
            workbook.write(out);
            out.close();
            System.out.println("Legends.xlsx został utworzony pomyślnie");
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }

//    public static HashMap<String, Legend> readExcelFile() throws IOException {
//        FileInputStream f = new FileInputStream(new File("Legends.xlsx"));
//
//        Workbook workbook = new XSSFWorkbook(f);
//        Sheet firstSheet = workbook.getSheetAt(0);
//        Iterator<Row> iterator = firstSheet.iterator();
//
//        HashMap<String, Legend> readLegendData = new HashMap<>();
//        while (iterator.hasNext()) {
//            Row nextRow = iterator.next();
//            Iterator<Cell> cellIterator = nextRow.cellIterator();
//            ArrayList<String> legend = new ArrayList<>();
//            while (cellIterator.hasNext()) {
//
//                Cell cell = cellIterator.next();
//                if(cell.getStringCellValue().equals("")){
//                    legend.add("Unknown");
//                }else{
//                    legend.add(cell.getStringCellValue());
//                }
//
//            }
//
//
//            Legend l = new Legend(legend.get(0), legend.get(1), legend.get(2), legend.get(3), legend.get(4), legend.get(5), legend.get(6), legend.get(7), legend.get(8));
//
//            readLegendData.put(legend.get(0), l);
//        }
//
//        f.close();
//
//        return readLegendData;
//    }

    public static void InsertToDB(Map<String, Legend> legendsData) throws  SQLException {
        Connection conn = DBConnector.connect();
        PreparedStatement stmt = conn.prepareStatement("DELETE FROM legends");
        int rs = stmt.executeUpdate();

//        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
        int count = 0;
        StringBuilder insertStmt = new StringBuilder("Insert into legends (nickname, name, gender, age, weight, height, type, home_world, image_src, time_created) Values");
        for(Map.Entry<String, Legend> el : legendsData.entrySet()){
            String nickname = el.getValue().getNickname();
//            String name = el.getValue().getName();
//            String gender = el.getValue().getGender();
//            String age = el.getValue().getAge();
//            String weight = el.getValue().getWeight();
            String height = el.getValue().getHeight();
//            String type = el.getValue().getType();
//            String home_world = el.getValue().getHome_world();
//            String image_src = el.getValue().getImage_src();

            try{
                height = height.replaceAll("\"", "\\\\\"");
                height = height.replaceAll("\'", "\\\\\'");
            }catch(NullPointerException ignored){
            }

            LocalDateTime now = LocalDateTime.now();
            String str = " (\"" + nickname + "\", \"" + el.getValue().getName() + "\", \"" +el.getValue().getAge() + "\", \""+el.getValue().getGender()+" \", \""+el.getValue().getWeight()+"\", \" "+ height +"\", \""+el.getValue().getType()+"\", \""+el.getValue().getHome_world()+"\", \""+el.getValue().getImage_src()+"\", \""+el.getValue().getTime_created()+"\")";
            insertStmt.append(str);
            count++;
            if(count != legendsData.size()){
                insertStmt.append(", ");
            }
        }
        System.out.println(insertStmt);
        PreparedStatement insert = conn.prepareStatement(insertStmt.toString());
        int execute = insert.executeUpdate();
    }

    public static HashMap<String, Legend> readFromDB() throws SQLException {
        Connection conn = DBConnector.connect();
        PreparedStatement stmt = conn.prepareStatement("Select * from legends");
        ResultSet rs = stmt.executeQuery();
        HashMap<String, Legend> readLegendData = new HashMap<>();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

//        if(rs.wasNull()){
//            throw new SQLException();
//        }
        while(rs.next()){
            String nickname = rs.getString("nickname");
            String name = rs.getString("name");
            String age = rs.getString("age");
            String gender = rs.getString("gender");
            String weight = rs.getString("weight");
            String height = rs.getString("height");
            String type = rs.getString("type");
            String home_world = rs.getString("home_world");
            String img_src = rs.getString("image_src");
            String time_created = rs.getString("time_created");

            if(weight == null){
                weight = "Unknown";
            }
            if(height == null){
                height = "Unknown";
            }

            LocalDateTime dateTime = LocalDateTime.parse(time_created, formatter);

            Legend l = new Legend(nickname, name, gender, age, weight, height, type, home_world, img_src, dateTime);
            readLegendData.put(nickname, l);
        }

        return readLegendData;
    }

}
