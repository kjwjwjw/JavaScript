package jsp11_board;

/*
 CREATE TABLE board (
 	name VARCHAR(16),
 	pass VARCHAR(16),
 	subject VARCHAR(50),
 	content VARCHAR(2000)
 );
 */
public class BoardDTO {
	private String name;
	private String pass;
	private String subject;
	private String content;
	
	public BoardDTO() {}

	public BoardDTO(String name, String pass, String subject, String content) {
		this.name = name;
		this.pass = pass;
		this.subject = subject;
		this.content = content;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
}



















