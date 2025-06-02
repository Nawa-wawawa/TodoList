package beans;

public class Login {

	int id;
	private String mail;
	private String pass;
	private String name;
	
	public Login(int id, String mail, String pass, String name) {
		super();
		this.id = id;
		this.mail = mail;
		this.pass = pass;
		this.name = name;
	}

	public Login(String mail, String pass, String name) {
		super();
		this.mail = mail;
		this.pass = pass;
		this.name = name;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
}
