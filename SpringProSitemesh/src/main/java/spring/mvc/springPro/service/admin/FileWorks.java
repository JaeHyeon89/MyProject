package spring.mvc.springPro.service.admin;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component("fileWorks")
public class FileWorks {

	private String orgName;
	private String sysName;

	private String curPath = this.getClass().getResource("").getPath();
	private String upfileRoot = curPath.substring(1, curPath.indexOf(".metadata"))
			+ "SpringProSitemesh/src/main/webapp/resources/filepath";

	
	public boolean uploadAndGetName(String upfolder, MultipartFile upfile) {

		
		System.out.println("#.upload 경로 : "+upfileRoot);
		
		if (upfile.isEmpty()) {
			return false;
		}

//		File rootFile = new File(upfileRoot);
//		System.out.println("#. 폴더내 파일목록 : ");
//		for (File each : rootFile.listFiles()) { //폴더내 파일 리스트
//			System.out.println(" --" + each.getName());
//		}

		this.orgName = upfile.getOriginalFilename();
		this.sysName = this.orgName;

		File uploadFile = new File(upfileRoot + "/" + upfolder + "/" + this.sysName);

		int addNum = 1;

		while (uploadFile.exists()) {

			String extName = this.sysName.substring(this.sysName.lastIndexOf("."));
			String fName = this.sysName.substring(0, this.sysName.lastIndexOf("."));

			if (fName.contains("_")) {
				fName = fName.substring(0, fName.lastIndexOf("_"));
			}

			this.sysName = fName + "_" + addNum + extName;
			uploadFile = new File(upfileRoot + "/" + upfolder + "/"  + this.sysName);
			addNum++;
		}
		System.out.println("#. 파일업로드 성공 = " +this. sysName);

		try {

			byte[] byteArray = upfile.getBytes();

			OutputStream os = new FileOutputStream(uploadFile);
			os.write(byteArray);
			os.close();

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return true;
	}

	public String getOrgName() {
		return orgName;
	}

	public String getSysName() {
		return sysName;
	}

}
