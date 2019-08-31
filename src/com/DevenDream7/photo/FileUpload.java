package com.DevenDream7.photo;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.imageio.ImageIO;

import com.DevenDream7.util.db.ConnectionFactory;

public class FileUpload {

	public FileUpload(InputStream in, String userId) {
		InputStream compressImage = compressImage(in);
		Connection connection = ConnectionFactory.getConnection();
		try {
			
			PreparedStatement pst = connection
					.prepareStatement("UPDATE images SET photo=? WHERE userid=?");
			pst.setBlob(1, compressImage);
			pst.setString(2, userId);
			pst.executeUpdate();
			pst.close();
			connection.close();
		} catch (SQLException e) {

			System.err.println(e.getMessage());
		}finally{
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

	}
	
	private InputStream compressImage(InputStream in){
		BufferedImage resizeImageJpg;
		InputStream is=null;
		try {
            BufferedImage originalImage = ImageIO.read(in);
            int type = originalImage.getType() == 0 ? BufferedImage.TYPE_INT_ARGB : originalImage.getType();
            resizeImageJpg = resizeImage(originalImage, type);
            ByteArrayOutputStream os = new ByteArrayOutputStream();
            ImageIO.write(resizeImageJpg, "jpg", os);
            is = new ByteArrayInputStream(os.toByteArray());
            
        } catch (IOException e) {
            System.out.println(e.getMessage());
        }
		
		return is;
	}
	
	 private  BufferedImage resizeImage(BufferedImage originalImage, int type) {
	        BufferedImage resizedImage = new BufferedImage(200, 200, type);//set width and height of image
	        Graphics2D g = resizedImage.createGraphics();
	        g.drawImage(originalImage, 0, 0, 200, 200, null);
	        g.dispose();
	        return resizedImage;
	    }

}
