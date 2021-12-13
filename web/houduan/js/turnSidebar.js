const turnSidebar = document.querySelector('.turn-sidebar');
    const sidebar = document.querySelector('.sidebar');
    const sidebarList = document.querySelector('.sidebar-list');
    const spans = sidebarList.querySelectorAll('span');

    turnSidebar.addEventListener('click', () => {
        if (sidebar.className === 'sidebar spread-side') {
            sidebar.className = 'sidebar shrink-side'
            spans[0].title = "用户管理"
            spans[1].title = "语录管理"
            spans[2].title = "FM管理"
        } else {
            sidebar.className = 'sidebar spread-side'
            spans[0].title = ""
            spans[1].title = ""
            spans[2].title = ""
        }
    })
