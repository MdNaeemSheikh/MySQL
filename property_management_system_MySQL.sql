-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 10, 2024 at 05:00 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `property_management_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `amenities`
--

CREATE TABLE `amenities` (
  `amenity_id` int(11) NOT NULL,
  `amenity_type` varchar(50) DEFAULT NULL,
  `property_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `amenities`
--

INSERT INTO `amenities` (`amenity_id`, `amenity_type`, `property_id`) VALUES
(1, 'Swimming Pool', 1),
(2, 'Gym', 2),
(3, 'Parking Space', 3),
(4, 'Free Wi-Fi', 4),
(5, 'Security Service', 5),
(6, 'Garden Area', 6),
(7, 'Elevator', 1),
(8, 'Swimming Pool', 2),
(9, 'Gym', 3),
(10, 'Parking Space', 4),
(11, 'Free Wi-Fi', 5),
(12, 'Security Service', 6),
(13, 'Garden Area', 1),
(14, 'Elevator', 2),
(15, 'Swimming Pool', 3),
(16, 'Gym', 4),
(17, 'Parking Space', 5),
(18, 'Free Wi-Fi', 6);

-- --------------------------------------------------------

--
-- Table structure for table `communication_logs`
--

CREATE TABLE `communication_logs` (
  `log_id` int(11) NOT NULL,
  `sender_id` int(11) DEFAULT NULL,
  `receiver_id` int(11) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `status` enum('Sent','Read') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `communication_logs`
--

INSERT INTO `communication_logs` (`log_id`, `sender_id`, `receiver_id`, `message`, `date`, `status`) VALUES
(1, 2, 3, 'Hello, can you please check the issue with the AC?', '2024-12-01 10:30:00', ''),
(2, 3, 2, 'Sure, I will send someone to fix it today.', '2024-12-01 11:00:00', ''),
(3, 4, 5, 'Have you received the payment for last month?', '2024-12-02 09:15:00', 'Read'),
(4, 5, 4, 'Yes, the payment has been received.', '2024-12-02 09:30:00', 'Read'),
(5, 6, 7, 'We need to discuss the lease renewal terms.', '2024-12-03 14:00:00', ''),
(6, 7, 6, 'Let us schedule a meeting for next week.', '2024-12-03 15:00:00', ''),
(7, 4, 1, 'Can you share the details for the promotional offer?', '2024-12-04 12:00:00', '');

-- --------------------------------------------------------

--
-- Table structure for table `complaints`
--

CREATE TABLE `complaints` (
  `complaint_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `property_id` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `status` enum('Open','Resolved') DEFAULT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `complaints`
--

INSERT INTO `complaints` (`complaint_id`, `user_id`, `property_id`, `description`, `status`, `date`) VALUES
(1, 2, 1, 'Water leakage in bathroom', '', '2024-12-01'),
(2, 3, 2, 'Electricity outage in living room', 'Resolved', '2024-12-03'),
(3, 4, 3, 'Broken window in bedroom', '', '2024-12-05'),
(4, 5, 4, 'AC not functioning', '', '2024-12-07'),
(5, 6, 5, 'Pest control required', 'Resolved', '2024-12-09'),
(6, 7, 6, 'Noisy neighbors', '', '2024-12-11');

-- --------------------------------------------------------

--
-- Table structure for table `contracts`
--

CREATE TABLE `contracts` (
  `contract_id` int(11) NOT NULL,
  `rental_id` int(11) DEFAULT NULL,
  `terms` text DEFAULT NULL,
  `signature_date` date DEFAULT NULL,
  `expiry_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contracts`
--

INSERT INTO `contracts` (`contract_id`, `rental_id`, `terms`, `signature_date`, `expiry_date`) VALUES
(1, 1, 'Standard 1-year rental terms', '2023-12-01', '2024-12-01'),
(2, 2, 'Standard 1-year rental terms', '2023-12-15', '2024-12-15'),
(3, 3, '2-year rental contract', '2024-05-01', '2026-05-01'),
(4, 4, 'Short-term rental', '2024-03-05', '2024-06-05'),
(5, 5, '1-year rental with renovation clause', '2024-04-10', '2025-04-10'),
(6, 6, 'Lease renewal', '2024-06-20', '2025-06-20'),
(7, 7, 'Office space lease', '2024-10-01', '2025-10-01');

-- --------------------------------------------------------

--
-- Table structure for table `document_management`
--

CREATE TABLE `document_management` (
  `document_id` int(11) NOT NULL,
  `document_type` varchar(50) DEFAULT NULL,
  `rental_id` int(11) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `managed_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `document_management`
--

INSERT INTO `document_management` (`document_id`, `document_type`, `rental_id`, `update_date`, `managed_by`) VALUES
(1, 'Rental Agreement', 1, '2024-12-01 00:00:00', 1),
(2, 'Maintenance Log', 2, '2024-12-05 00:00:00', 4),
(3, 'Financial Report', 3, '2024-11-15 00:00:00', 6),
(4, 'Insurance Policy', 4, '2024-10-20 00:00:00', 5),
(5, 'Lease Term Sheet', 5, '2024-11-10 00:00:00', 1),
(6, 'Update on Lease Terms', 6, '2024-12-05 00:00:00', 2),
(7, 'Renovation Agreement', 7, '2024-12-09 00:00:00', 7);

-- --------------------------------------------------------

--
-- Table structure for table `inventory_management`
--

CREATE TABLE `inventory_management` (
  `inventory_id` int(11) NOT NULL,
  `item_name` varchar(100) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `conditions` varchar(50) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `inventory_management`
--

INSERT INTO `inventory_management` (`inventory_id`, `item_name`, `quantity`, `conditions`, `product_id`) VALUES
(1, 'Air Conditioner', 10, 'Good', 201),
(2, 'Fridge', 5, 'New', 202),
(3, 'Washing Machine', 12, 'Excellent', 203),
(4, 'Microwave', 8, 'Good', 204),
(5, 'Ceiling Fan', 6, 'Fair', 205),
(6, 'Electric Water Heater', 15, 'New', 206),
(7, 'LED TV', 4, 'Excellent', 207);

-- --------------------------------------------------------

--
-- Table structure for table `lease_termination_request`
--

CREATE TABLE `lease_termination_request` (
  `termination_id` int(11) NOT NULL,
  `rental_id` int(11) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `date` date DEFAULT NULL,
  `status` enum('Pending','Approved','Rejected') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lease_termination_request`
--

INSERT INTO `lease_termination_request` (`termination_id`, `rental_id`, `reason`, `date`, `status`) VALUES
(1, 1, 'Lease completed as planned', '2024-12-01', 'Approved'),
(2, 2, 'Tenant relocated to a different city', '2024-12-05', 'Pending'),
(3, 3, 'End of lease agreement', '2024-11-15', 'Approved'),
(4, 4, 'Short-term lease ended', '2024-12-10', ''),
(5, 5, 'Tenant upgraded to larger property', '2024-12-08', 'Approved'),
(6, 6, 'Property rented to a new tenant', '2024-12-06', ''),
(7, 7, 'Lease renewed', '2024-12-09', '');

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `location_id` int(11) NOT NULL,
  `address` text DEFAULT NULL,
  `zip_code` varchar(10) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`location_id`, `address`, `zip_code`, `city`, `state`) VALUES
(1, '123 Dhanmondi, Dhaka', '1209', 'Dhaka', 'Dhaka'),
(2, '456 Gulshan, Dhaka', '1212', 'Dhaka', 'Dhaka'),
(3, '789 Banani, Dhaka', '1213', 'Dhaka', 'Dhaka'),
(4, '101 Uttara, Dhaka', '1230', 'Dhaka', 'Dhaka'),
(5, '303 Sylhet Road, Sylhet', '3100', 'Sylhet', 'Sylhet'),
(6, '404 Chattogram, Chattogram', '4000', 'Chattogram', 'Chattogram');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `login_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `status` enum('Active','Inactive') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`login_id`, `user_id`, `username`, `password`, `last_login`, `status`) VALUES
(1, 1, 'afsana', 'password123', '2024-12-09 08:00:00', 'Active'),
(2, 2, 'rahimk', 'securepass', '2024-12-09 08:30:00', 'Active'),
(3, 3, 'laila', 'laila123', '2024-12-08 10:15:00', 'Inactive'),
(4, 4, 'karim', 'karim2023', '2024-12-09 07:45:00', 'Active'),
(5, 5, 'nusrat', 'nusrat@2024', '2024-12-09 09:00:00', 'Active'),
(6, 6, 'faisal', 'faisal2024', '2024-12-09 08:20:00', 'Active'),
(7, 7, 'tanzina', 'tanzinapass', '2024-12-07 18:30:00', 'Inactive');

-- --------------------------------------------------------

--
-- Table structure for table `maintenance_request`
--

CREATE TABLE `maintenance_request` (
  `request_id` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `description` text DEFAULT NULL,
  `status` enum('Pending','In Progress','Completed') DEFAULT NULL,
  `property_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `maintenance_request`
--

INSERT INTO `maintenance_request` (`request_id`, `date`, `description`, `status`, `property_id`) VALUES
(1, '2024-12-01', 'Leaking water pipe in kitchen', 'Pending', 1),
(2, '2024-12-02', 'Broken window', 'In Progress', 2),
(3, '2024-12-05', 'AC unit not cooling properly', 'Completed', 3),
(4, '2024-12-07', 'Bathroom faucet repair', 'Pending', 4),
(5, '2024-12-08', 'Door lock issue', '', 5),
(6, '2024-12-09', 'Power outage in bedroom', 'In Progress', 6),
(7, '2024-12-10', 'Faucet replacement', 'Pending', 4);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `notification_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `status` enum('Unread','Read') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`notification_id`, `user_id`, `message`, `date`, `status`) VALUES
(1, 1, 'Your rent payment is due tomorrow.', '2024-12-09 10:00:00', 'Unread'),
(2, 2, 'A new maintenance request has been submitted.', '2024-12-09 11:00:00', 'Read'),
(3, 3, 'Your lease contract will expire soon.', '2024-12-08 15:30:00', 'Unread'),
(4, 4, 'A new document has been uploaded to your account.', '2024-12-09 09:15:00', 'Read'),
(5, 5, 'Your property has been listed in the featured section.', '2024-12-09 14:00:00', 'Unread'),
(6, 6, 'A tenant has provided feedback for your rental.', '2024-12-09 17:00:00', 'Read'),
(7, 7, 'A new service provider has been added.', '2024-12-07 13:00:00', 'Unread');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `payment_id` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `amount` decimal(15,2) DEFAULT NULL,
  `method_id` int(11) DEFAULT NULL,
  `rental_id` int(11) DEFAULT NULL,
  `property_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`payment_id`, `date`, `amount`, `method_id`, `rental_id`, `property_id`) VALUES
(1, '2024-12-01', 25000.00, 1, 1, 1),
(2, '2024-12-05', 18000.00, 2, 2, 2),
(3, '2024-12-10', 30000.00, 3, 3, 3),
(4, '2024-12-15', 22000.00, 1, 4, 4),
(5, '2024-12-20', 26000.00, 2, 5, 5),
(6, '2024-12-25', 24000.00, 3, 6, 6);

-- --------------------------------------------------------

--
-- Table structure for table `payment_methods`
--

CREATE TABLE `payment_methods` (
  `id` int(11) NOT NULL,
  `method_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment_methods`
--

INSERT INTO `payment_methods` (`id`, `method_name`) VALUES
(1, 'Credit Card'),
(2, 'Bank Transfer'),
(3, 'bKash'),
(4, 'Cash'),
(5, 'Nagad');

-- --------------------------------------------------------

--
-- Table structure for table `promotional_offers`
--

CREATE TABLE `promotional_offers` (
  `offer_id` int(11) NOT NULL,
  `discount_type` varchar(50) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `property_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `promotional_offers`
--

INSERT INTO `promotional_offers` (`offer_id`, `discount_type`, `start_date`, `end_date`, `property_id`) VALUES
(1, 'Percentage', '2024-12-01', '2024-12-31', 1),
(2, 'Fixed Amount', '2024-12-05', '2025-01-05', 2),
(3, 'Free Service', '2024-12-10', '2024-12-20', 3),
(4, 'Percentage', '2024-12-15', '2025-02-15', 4),
(5, 'Fixed Amount', '2024-12-10', '2025-01-10', 5),
(6, 'Free Service', '2024-12-08', '2024-12-31', 6),
(7, 'Percentage', '2024-12-12', '2025-01-12', 5);

-- --------------------------------------------------------

--
-- Table structure for table `property`
--

CREATE TABLE `property` (
  `property_id` int(11) NOT NULL,
  `address` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `price` decimal(15,2) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `property`
--

INSERT INTO `property` (`property_id`, `address`, `description`, `type`, `price`, `location_id`) VALUES
(1, '123 Dhanmondi, Dhaka', 'Beautiful 3-bedroom flat', 'Apartment', 30000000.00, 1),
(2, '456 Gulshan, Dhaka', 'Spacious 2-bedroom condo', 'Condo', 25000000.00, 2),
(3, '789 Banani, Dhaka', 'Luxury penthouse with city view', 'Penthouse', 50000000.00, 3),
(4, '101 Uttara, Dhaka', 'Cozy studio apartment', 'Studio', 15000000.00, 4),
(5, '303 Sylhet Road, Sylhet', 'Modern 2-bedroom condo', 'Condo', 18000000.00, 5),
(6, '404 Chattogram, Chattogram', 'Office space in city center', 'Commercial', 22000000.00, 6);

-- --------------------------------------------------------

--
-- Table structure for table `property_types`
--

CREATE TABLE `property_types` (
  `type_id` int(11) NOT NULL,
  `type_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `property_types`
--

INSERT INTO `property_types` (`type_id`, `type_name`) VALUES
(1, 'Apartment'),
(2, 'Condo'),
(3, 'House'),
(4, 'Studio'),
(5, 'Penthouse'),
(6, 'Commercial');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `review_id` int(11) NOT NULL,
  `rental_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL CHECK (`rating` between 1 and 5),
  `comments` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`review_id`, `rental_id`, `user_id`, `rating`, `comments`) VALUES
(1, 1, 3, 4, 'Nice place, clean and well-maintained.'),
(2, 2, 3, 3, 'Good location, but noisy at night.'),
(3, 3, 6, 5, 'Excellent view and very spacious.'),
(4, 4, 7, 2, 'Not as advertised, too small.'),
(5, 5, 5, 4, 'Spacious and great for families.'),
(6, 6, 2, 4, 'Modern and well-located.'),
(7, 7, 1, 5, 'Perfect for our business needs.');

-- --------------------------------------------------------

--
-- Table structure for table `service_categories`
--

CREATE TABLE `service_categories` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `service_categories`
--

INSERT INTO `service_categories` (`category_id`, `category_name`, `description`) VALUES
(1, 'Plumbing', 'Services related to water systems and repairs.'),
(2, 'Electrical', 'Services for wiring and electrical maintenance.'),
(3, 'Cleaning', 'Housekeeping and cleaning services.'),
(4, 'AC Maintenance', 'Maintenance for air conditioning units.'),
(5, 'Gardening', 'Services for maintaining outdoor gardens.'),
(6, 'Security', 'Monitoring and security services.'),
(7, 'Painting', 'Wall and surface painting services.');

-- --------------------------------------------------------

--
-- Table structure for table `service_providers`
--

CREATE TABLE `service_providers` (
  `provider_id` int(11) NOT NULL,
  `service_type` varchar(50) DEFAULT NULL,
  `contact_number` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `address` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `service_providers`
--

INSERT INTO `service_providers` (`provider_id`, `service_type`, `contact_number`, `email`, `address`) VALUES
(1, 'Plumbing', '+8801788888888', 'plumber@dhaka.com', '123 Green Road, Dhaka'),
(2, 'Electrical', '+8801766666666', 'electrician@dhaka.com', '456 Blue Street, Dhaka'),
(3, 'Cleaning', '+8801755555555', 'cleaner@dhaka.com', '789 White Avenue, Dhaka'),
(4, 'AC Maintenance', '+8801744444444', 'ac.service@dhaka.com', '101 Silver Plaza, Dhaka'),
(5, 'Gardening', '+8801733333333', 'garden@dhaka.com', '202 Gold Lane, Dhaka'),
(6, 'Security', '+8801722222222', 'security@dhaka.com', '303 Safety Hub, Dhaka'),
(7, 'Painting', '+8801711111111', 'painter@dhaka.com', '404 Brush Street, Dhaka');

-- --------------------------------------------------------

--
-- Table structure for table `tenant_rental_record`
--

CREATE TABLE `tenant_rental_record` (
  `rental_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `property_id` int(11) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `status` enum('Active','Terminated') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tenant_rental_record`
--

INSERT INTO `tenant_rental_record` (`rental_id`, `user_id`, `property_id`, `start_date`, `end_date`, `status`) VALUES
(1, 3, 2, '2024-01-01', '2025-01-01', 'Active'),
(2, 3, 4, '2024-03-01', '2025-03-01', ''),
(3, 6, 3, '2024-06-01', '2025-06-01', 'Active'),
(4, 5, 1, '2024-02-01', '2025-02-01', 'Active'),
(5, 7, 3, '2024-11-01', '2025-11-01', 'Active'),
(6, 2, 5, '2024-07-01', '2025-07-01', 'Active'),
(7, 1, 6, '2024-08-01', '2025-08-01', '');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `transaction_id` int(11) NOT NULL,
  `transaction_type` varchar(50) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `remarks` text DEFAULT NULL,
  `date` date DEFAULT NULL,
  `payment_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`transaction_id`, `transaction_type`, `quantity`, `remarks`, `date`, `payment_id`) VALUES
(1, 'Rent Payment', 1, 'Monthly rent paid', '2024-12-01', 1),
(2, 'Utility Payment', 3, 'Electricity, Gas, Water', '2024-12-05', 2),
(3, 'Repair Cost', 1, 'Repaired kitchen faucet', '2024-12-10', 3),
(4, 'Maintenance Fee', 1, 'Maintenance of common areas', '2024-12-15', 4),
(5, 'Late Payment Fee', 1, 'Paid late rent fine', '2024-12-20', 5),
(6, 'Advance Payment', 1, 'Advance payment for next month', '2024-12-25', 6);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `status` enum('Active','Inactive') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `role_id`, `name`, `email`, `phone`, `password`, `status`) VALUES
(1, 1, 'Afsana Begum', 'afsana.begum@banglamail.com', '+8801712345678', 'password123', 'Active'),
(2, 2, 'Rahim Khan', 'rahim.khan@banglamail.com', '+8801812345678', 'securepass', 'Active'),
(3, 3, 'Laila Akter', 'laila.akter@banglamail.com', '+8801912345678', 'laila123', 'Inactive'),
(4, 4, 'Mohammad Karim', 'mohammad.karim@banglamail.com', '+8801512345678', 'karim2023', 'Active'),
(5, 2, 'Nusrat Jahan', 'nusrat.jahan@banglamail.com', '+8801423456789', 'nusrat@2024', 'Active'),
(6, 3, 'Faisal Alam', 'faisal.alam@banglamail.com', '+8801634567890', 'faisal2024', 'Active'),
(7, 4, 'Tanzina Sultana', 'tanzina.sultana@banglamail.com', '+8801712345679', 'tanzinapass', 'Inactive');

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_roles`
--

INSERT INTO `user_roles` (`role_id`, `role_name`) VALUES
(1, 'Admin'),
(2, 'Landlord'),
(3, 'Tenant'),
(4, 'Property Manager');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `amenities`
--
ALTER TABLE `amenities`
  ADD PRIMARY KEY (`amenity_id`),
  ADD KEY `property_id` (`property_id`);

--
-- Indexes for table `communication_logs`
--
ALTER TABLE `communication_logs`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `sender_id` (`sender_id`),
  ADD KEY `receiver_id` (`receiver_id`);

--
-- Indexes for table `complaints`
--
ALTER TABLE `complaints`
  ADD PRIMARY KEY (`complaint_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `property_id` (`property_id`);

--
-- Indexes for table `contracts`
--
ALTER TABLE `contracts`
  ADD PRIMARY KEY (`contract_id`),
  ADD KEY `rental_id` (`rental_id`);

--
-- Indexes for table `document_management`
--
ALTER TABLE `document_management`
  ADD PRIMARY KEY (`document_id`),
  ADD KEY `rental_id` (`rental_id`),
  ADD KEY `managed_by` (`managed_by`);

--
-- Indexes for table `inventory_management`
--
ALTER TABLE `inventory_management`
  ADD PRIMARY KEY (`inventory_id`);

--
-- Indexes for table `lease_termination_request`
--
ALTER TABLE `lease_termination_request`
  ADD PRIMARY KEY (`termination_id`),
  ADD KEY `rental_id` (`rental_id`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`location_id`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`login_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `maintenance_request`
--
ALTER TABLE `maintenance_request`
  ADD PRIMARY KEY (`request_id`),
  ADD KEY `property_id` (`property_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`notification_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `method_id` (`method_id`),
  ADD KEY `rental_id` (`rental_id`),
  ADD KEY `property_id` (`property_id`);

--
-- Indexes for table `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `promotional_offers`
--
ALTER TABLE `promotional_offers`
  ADD PRIMARY KEY (`offer_id`),
  ADD KEY `property_id` (`property_id`);

--
-- Indexes for table `property`
--
ALTER TABLE `property`
  ADD PRIMARY KEY (`property_id`),
  ADD KEY `location_id` (`location_id`);

--
-- Indexes for table `property_types`
--
ALTER TABLE `property_types`
  ADD PRIMARY KEY (`type_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `rental_id` (`rental_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `service_categories`
--
ALTER TABLE `service_categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `service_providers`
--
ALTER TABLE `service_providers`
  ADD PRIMARY KEY (`provider_id`);

--
-- Indexes for table `tenant_rental_record`
--
ALTER TABLE `tenant_rental_record`
  ADD PRIMARY KEY (`rental_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `property_id` (`property_id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`transaction_id`),
  ADD KEY `payment_id` (`payment_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `role_id` (`role_id`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `amenities`
--
ALTER TABLE `amenities`
  MODIFY `amenity_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `communication_logs`
--
ALTER TABLE `communication_logs`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `complaints`
--
ALTER TABLE `complaints`
  MODIFY `complaint_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `contracts`
--
ALTER TABLE `contracts`
  MODIFY `contract_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `document_management`
--
ALTER TABLE `document_management`
  MODIFY `document_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `inventory_management`
--
ALTER TABLE `inventory_management`
  MODIFY `inventory_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `lease_termination_request`
--
ALTER TABLE `lease_termination_request`
  MODIFY `termination_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `location_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `login_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `maintenance_request`
--
ALTER TABLE `maintenance_request`
  MODIFY `request_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `notification_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `payment_methods`
--
ALTER TABLE `payment_methods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `promotional_offers`
--
ALTER TABLE `promotional_offers`
  MODIFY `offer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `property`
--
ALTER TABLE `property`
  MODIFY `property_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `property_types`
--
ALTER TABLE `property_types`
  MODIFY `type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `service_categories`
--
ALTER TABLE `service_categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `service_providers`
--
ALTER TABLE `service_providers`
  MODIFY `provider_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tenant_rental_record`
--
ALTER TABLE `tenant_rental_record`
  MODIFY `rental_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `transaction_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `user_roles`
--
ALTER TABLE `user_roles`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `amenities`
--
ALTER TABLE `amenities`
  ADD CONSTRAINT `amenities_ibfk_1` FOREIGN KEY (`property_id`) REFERENCES `property` (`property_id`);

--
-- Constraints for table `communication_logs`
--
ALTER TABLE `communication_logs`
  ADD CONSTRAINT `communication_logs_ibfk_1` FOREIGN KEY (`sender_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `communication_logs_ibfk_2` FOREIGN KEY (`receiver_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `complaints`
--
ALTER TABLE `complaints`
  ADD CONSTRAINT `complaints_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `complaints_ibfk_2` FOREIGN KEY (`property_id`) REFERENCES `property` (`property_id`);

--
-- Constraints for table `contracts`
--
ALTER TABLE `contracts`
  ADD CONSTRAINT `contracts_ibfk_1` FOREIGN KEY (`rental_id`) REFERENCES `tenant_rental_record` (`rental_id`);

--
-- Constraints for table `document_management`
--
ALTER TABLE `document_management`
  ADD CONSTRAINT `document_management_ibfk_1` FOREIGN KEY (`rental_id`) REFERENCES `tenant_rental_record` (`rental_id`),
  ADD CONSTRAINT `document_management_ibfk_2` FOREIGN KEY (`managed_by`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `lease_termination_request`
--
ALTER TABLE `lease_termination_request`
  ADD CONSTRAINT `lease_termination_request_ibfk_1` FOREIGN KEY (`rental_id`) REFERENCES `tenant_rental_record` (`rental_id`);

--
-- Constraints for table `login`
--
ALTER TABLE `login`
  ADD CONSTRAINT `login_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `maintenance_request`
--
ALTER TABLE `maintenance_request`
  ADD CONSTRAINT `maintenance_request_ibfk_1` FOREIGN KEY (`property_id`) REFERENCES `property` (`property_id`);

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`method_id`) REFERENCES `payment_methods` (`id`),
  ADD CONSTRAINT `payments_ibfk_2` FOREIGN KEY (`rental_id`) REFERENCES `tenant_rental_record` (`rental_id`),
  ADD CONSTRAINT `payments_ibfk_3` FOREIGN KEY (`property_id`) REFERENCES `property` (`property_id`);

--
-- Constraints for table `promotional_offers`
--
ALTER TABLE `promotional_offers`
  ADD CONSTRAINT `promotional_offers_ibfk_1` FOREIGN KEY (`property_id`) REFERENCES `property` (`property_id`);

--
-- Constraints for table `property`
--
ALTER TABLE `property`
  ADD CONSTRAINT `property_ibfk_1` FOREIGN KEY (`location_id`) REFERENCES `locations` (`location_id`);

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`rental_id`) REFERENCES `tenant_rental_record` (`rental_id`),
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `tenant_rental_record`
--
ALTER TABLE `tenant_rental_record`
  ADD CONSTRAINT `tenant_rental_record_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `tenant_rental_record_ibfk_2` FOREIGN KEY (`property_id`) REFERENCES `property` (`property_id`);

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`payment_id`) REFERENCES `payments` (`payment_id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `user_roles` (`role_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
