function toggleMenu() {
            const menu = document.querySelector('.toggle-menu');
            menu.style.display = menu.style.display === 'block' ? 'none' : 'block';
        }

        window.onclick = function(event) {
            if (!event.target.matches('.profile-icon, .profile-icon *')) {
                const menu = document.querySelector('.toggle-menu');
                if (menu.style.display === 'block') {
                    menu.style.display = 'none';
                }
            }
        }
        
document.addEventListener('DOMContentLoaded', function() {
    const searchInput = document.querySelector('.keyword');

    searchInput.addEventListener('keyup', function(event) {
        if (event.key === 'Enter') {
            const query = searchInput.value.trim();
            if (query) {
                window.location.href = `/gza/search.do?page1&keyword=${encodeURIComponent(query)}`;
            }
        }
    });
});