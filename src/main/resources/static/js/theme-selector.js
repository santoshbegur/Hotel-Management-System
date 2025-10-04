/* =========================================================
   Theme Selector
========================================================= */
const themeSelector = document.getElementById('themeSelector');
themeSelector.addEventListener('change', function () {
    const theme = this.value;
    document.getElementById('themeStylesheet').href = `/css/themes/${theme}`;
    localStorage.setItem('selectedTheme', theme);
});

window.addEventListener('load', function () {
    // Apply saved theme
    const savedTheme = localStorage.getItem('selectedTheme');
    if (savedTheme) {
        document.getElementById('themeStylesheet').href = `/css/themes/${savedTheme}`;
        themeSelector.value = savedTheme;
    }
});
