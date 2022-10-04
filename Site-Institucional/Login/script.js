function showPassword(){
    const eye = document.getElementById('eye')
    const eyeSlash = document.getElementById('eye-slash')
    const fieldPassword = document.getElementById('field-password')

    if(eye.style.display === 'none'){
        eye.style.display = 'block';
        eyeSlash.style.display = 'none';
        fieldPassword.type = 'text';
    }else {
        eye.style.display = 'none';
        eyeSlash.style.display = 'block';
        fieldPassword.type = 'password';
    }
};

document.getElementById('btn-logar').addEventListener('click', function(e) {
    e.preventDefault()
    alert('Logado!')
})


// Function para "substituir" o css de uma tag por outra mas ao mesmo tempo "manter"
document.getElementsByClassName('header').addEventListener("scroll", function(){
    var header = document.querySelector("header")
    header.classList.toggle("dash",window.scrollY > 100)
})