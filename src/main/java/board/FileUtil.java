package board;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.multipart.FileRenamePolicy;

import board2.Board2DTO;

public class FileUtil {

	private static FileUtil instance = new FileUtil();
	
	public static FileUtil getInstance() {
		return instance;
	}
	
	private FileUtil() {}
	
	private final String saveDirectory = "C:\\upload";
	private final int maxPostSize = 1024 * 1024 * 50;
	private final String encoding = "UTF-8";
	private final FileRenamePolicy policy = new DefaultFileRenamePolicy();
	
	
	public MenuDTO getMenuDTO(HttpServletRequest request) throws IOException {
		MenuDTO dto = new MenuDTO();
		MultipartRequest mpRequest = new MultipartRequest(
				request, saveDirectory, maxPostSize, encoding, policy
		);
		
		File uploadFile = mpRequest.getFile("uploadFile");
		if( uploadFile != null) {
			dto.setMeatimage(uploadFile.getName());
		}
		
		if(mpRequest.getParameter("idx")!= null) {
			int idx = Integer.parseInt(mpRequest.getParameter("idx"));
			dto.setIdx(idx);
		}
		
		dto.setMeatname(mpRequest.getParameter("meatname"));
		dto.setContent(mpRequest.getParameter("content"));
		dto.setPrice(Integer.parseInt(mpRequest.getParameter("price")));
		
		return dto;
	}

	
	public BoardDTO getDTO(HttpServletRequest request) throws IOException {
		BoardDTO dto = new BoardDTO();
		MultipartRequest mpRequest = new MultipartRequest(
				request, saveDirectory, maxPostSize, encoding, policy
		);
		
		File uploadFile = mpRequest.getFile("uploadFile");
		if( uploadFile != null) {
			dto.setImage(uploadFile.getName());
		}
		
		if(mpRequest.getParameter("idx")!= null) {
			int idx = Integer.parseInt(mpRequest.getParameter("idx"));
			dto.setIdx(idx);
		}
		dto.setTitle(mpRequest.getParameter("title"));
		dto.setWriter(mpRequest.getParameter("writer"));
		dto.setContent(mpRequest.getParameter("content"));
		dto.setIpaddr(mpRequest.getParameter("ipaddr"));
		
		return dto;
	}
	
	public Board2DTO getBoard2DTO(HttpServletRequest request) throws IOException {
		Board2DTO dto = new Board2DTO();
		MultipartRequest mpRequest = new MultipartRequest(
				request, saveDirectory, maxPostSize, encoding, policy
		);
		
		File uploadFile = mpRequest.getFile("uploadFile");
		if( uploadFile != null) {
			dto.setPhoto_review(uploadFile.getName());
		}
		
		if(mpRequest.getParameter("idx")!= null) {
			int idx = Integer.parseInt(mpRequest.getParameter("idx"));
			dto.setIdx(idx);
		}
		
		dto.setMtitle(mpRequest.getParameter("mtitle"));
		dto.setMwriter(mpRequest.getParameter("mwriter"));
		dto.setMeatcontext(mpRequest.getParameter("meatcontext"));
		dto.setMeat_name(mpRequest.getParameter("meat_name"));
		dto.setMenu_name(mpRequest.getParameter("menu_name"));
		dto.setPrice(Integer.parseInt(mpRequest.getParameter("price")));

		
		return dto;
	}
}
