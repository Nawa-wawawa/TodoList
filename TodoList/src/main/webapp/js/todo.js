document.addEventListener("DOMContentLoaded", function () {
	const modalButton = document.querySelector('button[data-bs-toggle="modal"]');
	if (modalButton) {
		modalButton.addEventListener("click", function () {
			const status = document.getElementById("task-status").value;
			const task = document.getElementById("task-name").value;
			const deadline = document.getElementById("datepicker").value;

			document.getElementById("modal-status").textContent = status;
			document.getElementById("modal-task").textContent = task;
			document.getElementById("modal-deadline").textContent = deadline;
		});
	}
});

