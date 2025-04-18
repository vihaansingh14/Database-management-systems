When a user visits the website, they can either log in or create an account. Upon registration, the backend securely stores their information in the user database with encrypted passwords using hashing (e.g., bcrypt). A unique user ID is assigned, and a session or token (e.g., JWT) is created for authentication.

Once logged in, users are redirected to their dashboard. If they choose to upload a music sample for sale, the backend processes the uploaded file, stores it on a secure cloud storage (e.g., AWS S3), and records metadata such as title, genre, price, and uploader ID in the database. The sample becomes visible to other users for browsing and purchasing.

When a user decides to purchase a sample, the backend verifies payment through a secure payment gateway (e.g., Stripe or PayPal). Upon successful payment, the system generates a downloadable link for the buyer and updates the seller’s earnings. The transaction details are logged in the order history.

Both buyers and sellers can view their activity, including uploads, purchases, earnings, and downloads. Engagement and transaction data contribute to artist rankings. The backend continuously ensures data consistency, user authorization, and secure access throughout the entire process.
