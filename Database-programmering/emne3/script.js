const table = document.getElementById("dbTable")

async function getTodos() {
  const url = "http://127.0.0.1:5000";
  try {
    const response = await fetch(url);
    if (!response.ok) {
      throw new Error(`Response status: ${response.status}`);
    }

    return await response.json();
    
  } catch (error) {
    console.error(error.message);
  }
}

getTodos().then((todos) => {
	todos.forEach((todo) => {
		var row = table.insertRow(-1);

		var cell1 = row.insertCell(0);
		var cell2 = row.insertCell(1);
		var cell3 = row.insertCell(2);

		// Add some text to the new cells:
		cell1.innerHTML = todo.id;
		cell2.innerHTML = todo.name; 
		cell3.innerHTML = todo.is_complete;
	});
});
