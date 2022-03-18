//selector

const todoinput = document.querySelector(".todo-input");
const todobutton = document.querySelector(".todo-button");
const todolist = document.querySelector(".todo-list");
const todocategorize = document.querySelector(".categorize");
const searchtodo = document.forms["forms"].querySelector("input")


var textWrapper = document.querySelector('.heading .letters');
textWrapper.innerHTML = textWrapper.textContent.replace(/([^\x00\x80]|\w)/g, "<span class='letter'>$&</span>");



//eventlistner

todobutton.addEventListener('click',addTodo);
todolist.addEventListener("click",deletechecktodo);
todocategorize.addEventListener('click',categoriestodo);
searchtodo.addEventListener("keyup",todosearch)


//functions

function addTodo(event){
    
    event.preventDefault()//prevent from form submission

    //creating div
    const tododiv = document.createElement("div");
    tododiv.classList.add("todo");

    //creating todo list
    const listtodo  = document.createElement("li");
    listtodo.innerText = todoinput.value;
    listtodo.classList.add("todo-item");
    tododiv.appendChild(listtodo); //append the list items inside the div

    //check button
    const todochecktn = document.createElement("button");
    todochecktn.innerHTML = '<i class="fas fa-check"></i>'; //check btn icon
    todochecktn.classList.add("complete-btn");
    tododiv.appendChild(todochecktn);

    //remove option
    const todoremove = document.createElement("button");
    todoremove.innerHTML = '<i class="fas fa-trash"></i>';
    todoremove.classList.add("trash-btn");
    tododiv.appendChild(todoremove);

    todolist.appendChild(tododiv);

    //clearing the input value
    todoinput.value="";

}

function deletechecktodo(todoremoval){
    const item = todoremoval.target;
    if(item.classList[0]==="trash-btn"){
        const todo = item.parentElement;

        //transition
        todo.classList.add("fall");
        todo.addEventListener("transitionend",function() {

            todo.remove();
        }); 
    }

    if(item.classList[0]==="complete-btn"){
        const todo = item.parentElement;
        todo.classList.toggle("completed")
    }
    
}

function categoriestodo(todofilter){

    const todos = todolist.childNodes;
    todos.forEach(function(todo){
        switch(todofilter.target.value){
            case "all":
                todo.style.display = "flex";
                break;
            case "completed":
                if(todo.classList.contains("completed")){
                    todo.style.display = "flex";

                }else{
                    todo.style.display = "none";
                }
                break;
            case "incompleted":
                if(!todo.classList.contains('completed')){
                    todo.style.display = "flex";
                }else{
                    todo.style.display = "none"
                }

                break;
        }
    })



}

function todosearch(searchevent){
    const term  = searchevent.target.value.toLowerCase();
    const items = todolist.getElementsByTagName("li");
    Array.from(items).forEach(function(item){
        const getItem  = item.textContent;
        if(getItem.toLowerCase().indexOf(term) != -1){
            item.style.display = "flex";
        }else{
            item.style.display = "none";
        }
    });
}


//heading transition
anime.timeline({loop: true})
  .add({
    targets: '.heading .line',
    scaleY: [0,1],
    opacity: [0.5,1],
    easing: "easeOutExpo",
    duration: 700
  })
  .add({
    targets: '.heading .line',
    translateX: [0, document.querySelector('.heading .letters').getBoundingClientRect().width + 10],
    easing: "easeOutExpo",
    duration: 700,
    delay: 100
  }).add({
    targets: '.heading .letter',
    opacity: [0,1],
    easing: "easeOutExpo",
    duration: 600,
    offset: '-=775',
    delay: (el, i) => 34 * (i+1)
  }).add({
    targets: '.heading',
    opacity: 0,
    duration: 1000,
    easing: "easeOutExpo",
    delay: 1000
  });


  