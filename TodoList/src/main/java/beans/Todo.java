package beans;

import java.time.LocalDate;

public class Todo {
	private int id;
	private String status;
	private String task;
	private LocalDate deadline;
	private String name;
	
	
	public Todo(int id, String status, String task, LocalDate deadline, String name) {
		super();
		this.id = id;
		this.status = status;
		this.task = task;
		this.deadline = deadline;
		this.name = name;
	}
	
	public Todo( String status, String task, LocalDate deadline, String name) {
		super();
		this.status = status;
		this.task = task;
		this.deadline = deadline;
		this.name = name;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getTask() {
		return task;
	}

	public void setTask(String task) {
		this.task = task;
	}

	public LocalDate getDeadline() {
		return deadline;
	}

	public void setDeadline(LocalDate deadline) {
		this.deadline = deadline;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
}
