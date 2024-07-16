<?php
// Database connection
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "db_tickettrack";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

// Handle form submission
if ($_SERVER["REQUEST_METHOD"] == "POST") {
  $email = $_POST['helpEmail'];
  $message = $_POST['helpMessage'];

  // Check message length
  if (strlen($message) <= 50) {
    $stmt = $conn->prepare("INSERT INTO contact_form (email, message) VALUES (?, ?)");
    $stmt->bind_param("ss", $email, $message);

    if ($stmt->execute()) {
      echo "Message sent successfully!";
    } else {
      echo "Error: " . $stmt->error;
    }

    $stmt->close();
  } else {
    echo "Error: Message length exceeds 300 characters.";
  }
}

$conn->close();
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Travel Guide</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="CSS/guides.css">
    <link
    href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.5/font/bootstrap-icons.min.css"
    rel="stylesheet"
  />
  <link rel="stylesheet" href="CSS/nav_bar_guide.css">
</head>
<style>
  
</style>
<body>
<div class="container-fluid px-0" style=" background-color: #1d4355;">
      <div class="row gx-0" style=" background-color: #1d4355;">
        <div class="col-md-12">
          <nav class="navbar navbar-expand-lg bg-body-tertiary">
            <div class="container-fluid navigation px-0">
              <img src="Images/Ticket Track Card Prototype.png" width="110px" height="90px" />
              <a class="navbar-brand title" href="index.html">Ticket Track</a>
              <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
              </button>
              <div class="collapse navbar-collapse justify-content-between" id="navbarNavDropdown">
                <ul class="navbar-nav mx-auto">
                  <li class="nav-item">
                    <a class="nav-link" aria-current="page" href="index.html">
                      <i class="bi bi-house-door"></i> Home
                    </a>
                  </li>
                  <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                      <i class="bi bi-ticket-perforated"></i> Book &#9660;
                    </a>
                    <ul class="dropdown-menu">
                      <li><a class="dropdown-item" href="Inter_country.html"><i class="bi bi-globe"></i> Inter Country</a></li>
                      <li><a class="dropdown-item" href="Intra_country.html"><i class="bi bi-map"></i> Intra Country</a></li>
                    </ul>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="routes.html">
                      <i class="bi bi-map"></i> Routes
                    </a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="guides.php">
                      <i class="bi bi-book"></i> Guide
                    </a>
                  </li>
                </ul>
                <ul class="navbar-nav ms-auto" id="nav-user">
                  <li class="nav-item">
                    <a class="nav-link custom-login-btn" href="login.html">
                      Login
                    </a>
                  </li>
                </ul>
              </div>
            </div>
          </nav>
        </div>
      </div>
    </div>
     <!-- Navigation bar ends here-->
    <!-- Banner-->
    <div class="container-fluid p-0">
        <div class="banner text-center">
            <img src="https://w0.peakpx.com/wallpaper/776/456/HD-wallpaper-amazing-european-cityscape-alps-cityscapes-mountains-towns-lakes-nature.jpg"
                class="bannerimg" height="400px" width="800px" />
            <div class="banner-text">
                <h4>Travel Journal</h4>
            </div>
        </div>
    </div>
    <br />
    <!-- Page's content-->
    <div class="container">
        <div class="row">
            <div class="col-md-8">
                <div class="content">
                    <h2 class="question" style="color: teal">Exploring Germany</h2>
                    <div class="cover-photo">
                        <img src="https://i.pinimg.com/564x/2b/51/be/2b51be260ee48d145a124528590ea267.jpg"
                            class="img-fluid" height="450px" width="700px" />
                    </div>
                    <br />
                    <p>Germany offers some scenic train routes, like the Rhine Valley line and the Black Forest.
                        <br />Each city boasts its own unique specialties, from Berlin's eclectic cuisine to Munich's
                        traditional Bavarian delicacies, making train travel in Germany a journey filled with discovery
                        and delight.
                    </p>
                    <br />
                    <h2 class="question" style="color: teal">Belgium and its vibrance</h2>
                    <div class="cover-photo">
                        <img src="https://www.planetware.com/photos-large/B/belgium-brussels-la-grand-place-summer-day.jpg"
                            class="img-fluid" height="450px" width="700px" />
                    </div>
                    <br />
                    <p>Belgium, renowned for its medieval charm and gastronomic delights, offers accessible train
                        connections to iconic destinations like Brussels, with its historic Grand Place; Bruges, known
                        for its picturesque canals; and Ghent, boasting a blend of medieval architecture and vibrant
                        culture.</p>
                    <br />
                    <h2 class="question" style="color: teal">Scenic train routes within the Netherlands</h2>
                    <div class="cover-photo">
                        <img src="https://media.vietravel.com/images/NewsPicture/amsterdam_3.jpg" class="img-fluid"
                            height="450px" width="700px" />
                    </div>
                    <br />
                    <p style="text-align: justify">The Netherlands has several scenic routes, such as the journey from
                        Amsterdam to Maastricht,<br /> which offers beautiful countryside views. Another popular route
                        is from Rotterdam to Hague <br /> along the coast.</p>
                    <br />
                </div>
            </div>
            <!-- Sidebar Content-->
            <div class="col-md-4">
                <div class="sidebar">
                    <div class="image-container" onmouseover="hoverText(this, 'Munich, Germany')"
                        onmouseout="hoverText(this, ' Cologne Cathedral')">
                        <img src="https://i.pinimg.com/564x/4e/73/f3/4e73f391a62d54680c3d392dcbbd2940.jpg"
                            class="img-fluid" height="300px" width="300px" />
                        <div class="description">Cologne Cathedral</div>
                    </div>
                    <div class="image-container" onmouseover="hoverText(this, 'Amsterdam, Netherlands')"
                        onmouseout="hoverText(this, 'Leiden Canals')">
                        <img src="https://media.vietravel.com/images/NewsPicture/leiden_2.jpg" class="img-fluid"
                            height="300px" width="300px" />
                        <div class="description">Leiden Canals</div>
                    </div>
                    <div class="image-container" onmouseover="hoverText(this, 'Maastricht, Netherlands')"
                        onmouseout="hoverText(this, 'Vrijthof')">
                        <img src="https://media.vietravel.com/images/NewsPicture/maastricht-vrijthof_1.jpg"
                            class="img-fluid" height="300px" width="300px" />
                        <div class="description">Vrijthof</div>
                    </div>
                    <div class="image-container" onmouseover="hoverText(this, 'Brussels, Belgium')"
                        onmouseout="hoverText(this, 'Meuse Valley')">
                        <img src="https://www.planetware.com/photos-large/B/belgium-dinant-in-the-meuse-valley.jpg"
                            class="img-fluid" height="300px" width="300px" />
                        <div class="description">Meuse Valley</div>
                    </div>
                    <div class="image-container" onmouseover="hoverText(this, 'countryside, Belgium')"
                        onmouseout="hoverText(this, 'Waterloo')">
                        <img src="https://www.planetware.com/photos-large/B/belgium-waterloo.jpg" class="img-fluid"
                            height="300px" width="300px" />
                        <div class="description">Waterloo</div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- About Us-->
    <section class="about-section">
        <div class="container">
            <h2 class="about-heading">About Us</h2>
            <img src="https://media.istockphoto.com/id/908264570/photo/swiss-train-in-the-alps-mountains-in-switzerland-around-ospizio-bernina.jpg?s=612x612&w=0&k=20&c=PWGf3ToBpPEvwgG0HLWnQetvgJH3AIXssgDRloXLCt4="
                alt="About Image" class="about-image" />
            <div class="our-story">
                <h3>How it all started</h3>
                <p>your go-to platform for hassle-free train reservations. Our journey began with a mission to
                    revolutionize the way you book train tickets. Combining cutting-edge technology with user-friendly
                    interfaces, we strive to provide a seamless and efficient booking experience. Whether you're
                    planning a business trip or a leisurely getaway, TrainBookingPro ensures that your journey starts
                    smoothly with just a few clicks. Join us and experience the future of train travel today.</p>
            </div>
            <div class="our-approach">
                <h3>Our story</h3>
                <p>Our founders spent countless hours researching the needs of travelers and developing a platform that
                    combines cutting-edge technology with a user-friendly interface. We aimed to create an experience
                    that not only meets but exceeds the expectations of modern travelers. With a focus on reliability,
                    speed, and customer satisfaction, TrainBookingPro was designed to make your journey as smooth as
                    possible from the moment you book your ticket.</p>
            </div>
        </div>
    </section>
    <!-- Footer of help section-->
    <div class="footer">
        <button id="helpButton" class="btn btn-primary">Need Help?</button>
    </div>

    <!-- Footer of website-->
    <footer class="footer mt-custom bg-custom text-light py-3">
        <div class="container d-flex justify-content-between align-items-center">
            <div class="d-flex align-items-center">
                <img src="Images/Ticket Track Card Prototype.png" alt="Train Track Logo" class="footer-logo me-2"
                    style="width: 70px; height: 50px" />
                <span class="fs-4"
                    style="font-family: brush-script; font-size: 30px !important; font-weight: bold;"><b>Train
                        Track</b></span>
            </div>
            <div class="social-icons d-flex">
                <a href="https://www.facebook.com/raileurope/" target="_blank" class="mx-2"><img
                        src="Images/facebook.webp" alt="Facebook" class="social-icon" /></a>
                <a href="https://www.instagram.com/raileurope/?hl=en" target="_blank" class="mx-2"><img
                        src="Images/insta.png" alt="Instagram" class="social-icon" /></a>
                <a href="https://www.youtube.com/@CoasterFan2105" target="_blank" class="mx-2"><img
                        src="Images/youtube.jpg" alt="YouTube" class="social-icon" /></a>
                <a href="https://www.pinterest.com/search/pins/?rs=ac&len=2&q=train%20europe%20travel&eq=train%20eu&etslf=2744"
                    target="_blank" class="mx-2"><img src="Images/pint.png" alt="Pinterest" class="social-icon" /></a>
                <a href="https://x.com/raileurope?lang=en" target="_blank" class="mx-2"><img src="Images/twitter.webp"
                        alt="Twitter" class="social-icon" /></a>
            </div>
        </div>
        <div class="container text-center mt-3">
            <small>&copy; 2024 Train Track, Inc. All rights reserved</small>
        </div>
    </footer>

    <!-- Help pop up-->
    <div id="helpBoxModal" class="modal fade" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">How can we help you?</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p>If you have any questions or need assistance, please contact our support team.</p>
                    <form method="POST" action="">
                        <div class="form-group">
                            <label for="helpEmail">Email address</label>
                            <input type="email" class="form-control" id="helpEmail" name="helpEmail"
                                placeholder="Enter your email" required>
                        </div>
                        <div class="form-group">
                            <label for="helpMessage">Message</label>
                            <textarea class="form-control" id="helpMessage" name="helpMessage" rows="3"
                                placeholder="Type your message here" required></textarea>
                        </div>
                        <button type="submit" class="btn btn-primary">Send</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
    // Need help logic:
    function hoverText(element, newText) {
        element.querySelector(".description").innerText = newText;
    }
    $(document).ready(function() {
        $("#helpButton").click(function() {
            $("#helpBoxModal").modal("show");
        });
    });
    </script>
     
  <script src="user.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-tnuAQdXBczz8hbNfjF1GeJ9tmh1d5BXUqj3roK54Kk51l1Zo7d1O69FdoZh0yI9G" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-8rCF9LYbAwV5w2ipIeeC7XqDfJtP/40MeNnVsReUktd57p12Xwxfp7LVGmPhT9B+" crossorigin="anonymous"></script>
  
 
</body>

</html>