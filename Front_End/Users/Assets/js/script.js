var allValue = ['A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z','0','1','2','3','4','5','6','7','8','9']


var cVal1 = allValue[Math.floor(Math.random()*allValue.length)];
var cVal2 = allValue[Math.floor(Math.random()*allValue.length)];
var cVal3 = allValue[Math.floor(Math.random()*allValue.length)];
var cVal4 = allValue[Math.floor(Math.random()*allValue.length)];
var cVal5 = allValue[Math.floor(Math.random()*allValue.length)];
var cVal6 = allValue[Math.floor(Math.random()*allValue.length)];

var cValue = cVal1+cVal2+cVal3+cVal4+cVal5+cVal6;

captchaValue.innerHTML = cValue;

thisValue = "";
inputCaptcha.addEventListener('change', function(){
    thisValue = inputCaptcha.value;
})

btnLogin.addEventListener('click', function () {
    var username = document.getElementById("username").value;
    var password = document.getElementById("password").value;
    var inputCaptcha = document.getElementById("inputCaptcha");
    var cValue = thisValue;

    if (username === "Congluan108" && password === "Congluan@108" && cValue == inputCaptcha.value) {
        alert("Đăng nhập thành công!");
        window.location.href = "http://127.0.0.1:5500/Users/HomePage.html";
        document.LoginForm.submit();
    } else {
        if (inputCaptcha.value === "") {
            alert('Vui lòng nhập lại Captcha');
        } else {
            alert("Vui lòng thử lại.");
        }
    }
});

// Ấn hiện mật khẩu
function togglePassword() {
    var passwordInput = document.getElementById("password");
    var showPasswordIcon = document.getElementById("show-password");
    if (passwordInput.type === "password") {
        passwordInput.type = "text"; // Hiện mật khẩu
        showPasswordIcon.classList.remove("bxs-lock-alt");
        showPasswordIcon.classList.add("bxs-lock-open-alt");
    } else {
        passwordInput.type = "password"; // Ẩn mật khẩu
        showPasswordIcon.classList.remove("bxs-lock-open-alt");
        showPasswordIcon.classList.add("bxs-lock-alt");
    }
}




