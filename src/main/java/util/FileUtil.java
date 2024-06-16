package util;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class FileUtil {


	public static MultipartRequest getMulti(HttpServletRequest req) {
		ServletContext context = req.getServletContext();
		String path = context.getRealPath("/imageStorage");
		System.out.println("실제 저장 경로: " + path);
		
		int size = 1024 * 1024 * 10;
		MultipartRequest multi = null;

		try {
			multi = new MultipartRequest(req, path, size, "UTF-8", new DefaultFileRenamePolicy());
			return multi;
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public static List<String> getImgUrls(MultipartRequest multi){
		List<String> imgUrls = new ArrayList<>();
		Enumeration<?> files = multi.getFileNames();
		
		while (files.hasMoreElements()) {
			String name = (String) files.nextElement();
			String fileName = multi.getFilesystemName(name);
			System.out.println("Collected File Name: " + fileName);
			if (fileName != null) {
				imgUrls.add(fileName);
			}
		}
		return imgUrls;
	}
}
