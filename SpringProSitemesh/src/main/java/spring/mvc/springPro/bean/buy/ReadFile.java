package spring.mvc.springPro.bean.buy;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.util.ArrayList;
import java.util.List;

public class ReadFile {
	
	List<String> listc;
	String path="E:\\CES\\JAVA\\MyWorks_Spring\\SpringProSitemesh\\src\\main\\webapp\\resources\\buyTerms";
	String filename="";
	public List<String> phoneTerms(int num){	//핸드폰 이용약관 읽어오는 메소드
		listc=new ArrayList<>();
		
		if(num==1){
			filename="핸드폰 이용약관.txt";
		}else if(num==2){
			filename="핸드폰 이용약관2.txt";
		}
		
		
		//입출력할 파일 객체 생성
		File file=new File(path, filename);
		
		//입출력 진행
		
		//문자열 입력
		try{
		FileReader fr=new FileReader(file);//대상
		BufferedReader br=new BufferedReader(fr);
		
		//br을 이용하면 1줄을 읽어낼 수 있다.
		
		while(true){
			String txt=br.readLine();
			if(txt==null)break;
			listc.add(txt);
		}
		//통로 폐기
		fr.close();
		br.close();
		
		}catch(Exception e){}
		
		return listc;
	}
	

	public List<String> cardTerms(int num){	//핸드폰 이용약관 읽어오는 메소드
		listc=new ArrayList<>();
		

		if(num==3){
			filename="카드 이용약관.txt";
		}
		//입출력할 파일 객체 생성
		File file=new File(path, filename);
		
		//입출력 진행
		
		//문자열 입력
		try{
		FileReader fr=new FileReader(file);//대상
		BufferedReader br=new BufferedReader(fr);
		
		//br을 이용하면 1줄을 읽어낼 수 있다.
		
		while(true){
			String txt=br.readLine();
			if(txt==null)break;
			listc.add(txt);
		
		}
		//통로 폐기
		fr.close();
		br.close();
		
		}catch(Exception e){}
		
		return listc;
	}
	
	
	
}
