const body = document.querySelector("body"),
        sidebar = body.querySelector(".sidebar"),
        toggle = body.querySelector(".toggle"),
        modeSwitch = body.querySelector(".toggle-switch"),
        modeText = body.querySelector(".mode-text"),
        home = body.querySelector(".home");


        toggle.addEventListener("click",() =>{
            sidebar.classList.toggle("close");
             home.classList.toggle("close");
        });

        modeSwitch.addEventListener("click",() =>{
            body.classList.toggle("dark");

            if(body.classList.contains("dark")){
                modeText.innerText = "Light Mode"
            }else{
                modeText.innerText = "Dark Mode"
            }
        });

        
function login() {
    var username = document.getElementById("username").value;
    var password = document.getElementById("password").value;
        if (username === "admin" && password === "admin") {
            alert("Đăng nhập thành công!");
                window.location.href = "Dashboard.html";
            } else {
                alert("Vui lòng thử lại.");
            }
}

function togglePassword() {
    var passwordInput = document.getElementById("password");
    var showPasswordIcon = document.getElementById("show-password");

    if (passwordInput.type === "password") {
    passwordInput.type = "text"; 
    showPasswordIcon.classList.remove("bxs-lock-alt");
    showPasswordIcon.classList.add("bxs-lock-open-alt");
    } else {
    passwordInput.type = "password"; 
    showPasswordIcon.classList.remove("bxs-lock-open-alt");
    showPasswordIcon.classList.add("bxs-lock-alt");
    }
}


const addUserButton = document.getElementById("addUserButton");
const addUserForm = document.getElementById("addUserForm");
addUserButton.addEventListener("click", function (event) {
    event.preventDefault(); 
    addUserForm.style.display = "block";
});

function add(){
    window.location.href = 'AddUser.html';
}

function cancel(){
    window.location.href = 'Users.html';
}
function submitForm(){
    document.getElementById('successMessage').style.display = 'block';
    window.location.href = 'Users.html';
}   

function deleteUser(icon) {
    var row = icon.closest('tr');
    var confirmDelete = confirm("Are you sure you want to delete this user?");
    if (confirmDelete) {
        row.remove();
    }
}
