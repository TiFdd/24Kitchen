// Navbar Scroll - Adiciona efeito de mudança na navbar ao rolar a página
window.addEventListener('scroll', function () {
    let navbar = document.querySelector('.navbar');
    if (this.window.scrollY > 20) {
        navbar.classList.add('scrolled');
    } else {
        navbar.classList.remove('scrolled');
    }
});

// Menu Responsivo para Dispositivos Móveis
let menuBtn = document.getElementById("menu_btn");
let navItems = document.querySelector(".nav_items");

menuBtn.addEventListener("click", function () {
    navItems.classList.toggle("active");
});

// Scroll Suave para Seções Internas da Página
document.querySelectorAll('.nav_items a').forEach(anchor => {
    anchor.addEventListener('click', function (event) {
        event.preventDefault();
        let targetId = this.getAttribute('href').substring(1);
        let targetElement = document.getElementById(targetId);
        if (targetElement) {
            targetElement.scrollIntoView({ behavior: 'smooth' });
        }
    });
});

// Scroll Up - Rola suavemente para o topo da página ao clicar no botão
document.querySelector('#to-top')?.addEventListener('click', () => {
    let TopInterval = setInterval(() => {
        let ArrowTop = document.body.scrollTop > 0 ? document.body : document.documentElement;
        if (ArrowTop.scrollTop > 0) {
            ArrowTop.scrollTop -= 50;
        }
        if (ArrowTop.scrollTop < 1) {
            clearInterval(TopInterval);
        }
    }, 10);
});

// Mostrar ou ocultar o botão de scroll up
function showscroll() {
    let TopButton = document.getElementById('to-top');
    if (document.body.scrollTop > 100 || document.documentElement.scrollTop > 100) {
        TopButton.classList.add('show');
    } else {
        TopButton.classList.remove('show');
    }
}

// Aciona a função quando há rolagem na página
window.onscroll = () => {
    showscroll();
};

// Função para carregar as receitas dinamicamente
document.addEventListener('DOMContentLoaded', function () {
    // Função para buscar e exibir as receitas
    function loadRecipes() {
        fetch('php/fetch_recipes.php') // Endpoint para buscar as receitas
            .then(response => response.json()) // Converte a resposta para JSON
            .then(data => {
                const recipesContainer = document.getElementById('recipes-container'); // Contêiner para as receitas
                recipesContainer.innerHTML = ''; // Limpa o conteúdo anterior

                // Itera sobre as receitas e as exibe no HTML
                data.forEach(recipe => {
                    const recipeElement = document.createElement('div');
                    recipeElement.className = 'recipe';
                    recipeElement.innerHTML = `
                        <h2>${recipe.title}</h2>
                        <p>${recipe.description}</p>
                        <p><strong>Preparation Time:</strong> ${recipe.prep_time} minutes</p>
                        <p><strong>Cooking Time:</strong> ${recipe.cook_time} minutes</p>
                        <p><strong>Difficulty:</strong> ${recipe.difficulty}</p>
                        <p><strong>Cuisine Type:</strong> ${recipe.cuisine_type}</p>
                    `;
                    recipesContainer.appendChild(recipeElement);
                });
            })
            .catch(error => console.error('Error fetching recipes:', error)); // Trata erros
    }

    // Carrega as receitas ao carregar a página
    loadRecipes();
});

// Validação do Formulário de Contato (contact.html)
function validateForm() {
    let email = document.getElementById("email").value;
    let date = document.getElementById("date").value;

    // Verifica se o email pertence à Aston University
    if (!email.endsWith("@aston.ac.uk")) {
        alert("Please enter a valid Aston University email!");
        return false;
    }

    // Verifica se a data selecionada é no futuro
    let today = new Date().toISOString().split("T")[0];
    if (date <= today) {
        alert("Please select a future date.");
        return false;
    }

    alert("Form submitted successfully!");
    return true;
}

// Adiciona evento de submissão ao formulário de contato
document.getElementById("contact-form")?.addEventListener("submit", function (event) {
    event.preventDefault();
    validateForm();
});

// Função para enviar avaliações
document.querySelectorAll('.rating-form').forEach(form => {
    form.addEventListener('submit', function (event) {
        event.preventDefault(); // Impede o envio padrão do formulário

        const formData = new FormData(this); // Captura os dados do formulário

        fetch('php/submit_rating.php', {
            method: 'POST',
            body: formData
        })
        .then(response => response.json())
        .then(data => {
            if (data.status === 'success') {
                alert('Rating submitted successfully!');
            } else {
                alert('Error: ' + data.message);
            }
        })
        .catch(error => console.error('Error submitting rating:', error));
    });
});