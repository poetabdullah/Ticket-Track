# Ticket-Track

Ticket Track is a simple train booking website that lets you book a train ticket for a specific time and date, and for a specific number of passengers. It is designed for daily travel and lets you travel within a country (in this case Germany) and to nearby countries as well (in this case Belgium and Netherlands).

## Source code:

You can see all of the source code from **master** branch.

## Features

- **Book Tickets**: Easily book train tickets for specific times, dates, and number of passengers.
- **Daily Travel**: Designed for daily travel within Germany and to Belgium and the Netherlands.
- **Dynamic Data**: The website pulls displayed data directly from the database, ensuring up-to-date information.
- **Admin Panel**: All pages are connected to each other via an admin panel through a backend database.

## Technologies Used

- **Frontend**:
  - HTML
  - CSS
  - JavaScript
  - Bootstrap

- **Backend**:
  - PHP (XAMPP)
  - SQL (XAMPP)

## Installation

1. **Clone the repository**:
   ```bash
   git clone https://github.com/your-username/ticket-track.git
   cd ticket-track
2. **Set up XAMPP**:
Download and install XAMPP.
Start Apache and MySQL from the XAMPP control panel.

3. **Import the database**:

Open phpMyAdmin from the XAMPP control panel.
Create a new database (e.g., db_tickettrack).
Import the provided SQL file (allSQL.sql) into the newly created database.

4. **Configure the project**:

Place the project files in the htdocs directory of your XAMPP installation.

5. **Access the website**:

Open your web browser and go to http://localhost/ticket-track to access the website.

## Usage

1. **Booking a Ticket**:

Navigate to the booking page.
Select your departure and arrival locations, date, time, and number of passengers.
Click on the "Book Ticket" button to complete your booking.

2. **Admin Panel**:

Access the admin panel to manage routes, schedules, and other settings.
Ensure that the database is up-to-date with the latest information for accurate bookings.

## Contributing
Contributions are welcome! Please follow these steps to contribute:

Fork the repository.
Create a new branch (git checkout -b feature-branch).
Make your changes.
Commit your changes (git commit -m 'Add some feature').
Push to the branch (git push origin feature-branch).
Open a pull request.


## Contributors:
@AmbreenAmbi04 : Worked On Booking and its related pages on frontend and backend

@Hammad448 : Worked on Routes and its related pages on frontend and backend

@poetabdullah : Worked on homepage, admin panel and their related frontend and backend pages

@Hamda : Worked on Guides page and its backend and frontend


If you have any questions or suggestions, feel free to open an issue or contact us.

Thank you for using Ticket Track!
