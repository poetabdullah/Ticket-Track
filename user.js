document.addEventListener("DOMContentLoaded", function() {
    // Check for logged-in user in localStorage
    const loggedInUser = localStorage.getItem("loggedInUser");
    const navUser = document.getElementById("nav-user");

    if (loggedInUser) {
        // If user is logged in, display username
        navUser.innerHTML = `
            <li class="nav-item navy-link">
              <a class="nav-link" href="#" id="navbarDropdown" role="button" style="color: white; font-size: 20px; font-weight: bold; font-family: Arial, Helvetica, sans-serif;">
                <i class="bi bi-person"></i> ${loggedInUser}
              </a>
              <div class="navy-dropdown-menu">
                <a class="navy-dropdown-item" href="#" id="logout-button">Logout</a>
              </div>
            </li>`;

        // Add logout functionality
        const logoutButton = document.getElementById("logout-button");
        logoutButton.addEventListener("click", function() {
            localStorage.removeItem("loggedInUser");
            navUser.innerHTML = `<li class="nav-item">
              <a class="nav-link custom-login-btn" href="login.html">Login</a>
            </li>`;
            location.reload(); // Reload page to reflect changes
        });
    } else {
        // If user is not logged in, display login button
        navUser.innerHTML = `<li class="nav-item">
          <a class="nav-link custom-login-btn" href="login.html">Login</a>
        </li>`;
    }
});

function loginUser(username) {
    localStorage.setItem("loggedInUser", username);
    location.reload(); // Reload page to reflect changes
}
