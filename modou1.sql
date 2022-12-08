-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 07 déc. 2022 à 00:43
-- Version du serveur :  10.4.14-MariaDB
-- Version de PHP : 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `modou`
--

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nomcat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `categories`
--

INSERT INTO `categories` (`id`, `nomcat`, `created_at`, `updated_at`) VALUES
(1, 'Store', '2022-12-06 14:50:40', '2022-12-06 14:50:40');

-- --------------------------------------------------------

--
-- Structure de la table `clients`
--

CREATE TABLE `clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nomc` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `clients`
--

INSERT INTO `clients` (`id`, `nomc`, `telc`, `created_at`, `updated_at`) VALUES
(1, 'Ibra Ndiaye', '774874628', '2022-05-30 10:55:39', '2022-05-30 10:55:39'),
(2, 'Modou Fall', NULL, '2022-05-30 15:43:57', '2022-05-30 15:43:57'),
(3, 'MAMADOU DIALLO G. YOFF', '338249025', '2022-06-11 13:02:24', '2022-06-11 13:02:24'),
(5, 'THierno Ndiaye', '774636335', '2022-06-25 17:53:15', '2022-06-25 17:53:15'),
(7, 'Papae Seck/Nest', '772342324', '2022-07-30 17:39:26', '2022-07-30 17:39:26'),
(8, 'UII', '770000000', '2022-10-30 21:45:05', '2022-10-30 21:45:05'),
(9, 'UII', '770000000', '2022-10-30 21:45:05', '2022-10-30 21:45:05'),
(10, 'OUSMANE SY SEDIPAL', '770000000', '2022-10-30 21:50:03', '2022-10-30 21:50:03'),
(11, 'OUSMANE SY SEDIPAL', '770000000', '2022-10-30 21:50:04', '2022-10-30 21:50:04');

-- --------------------------------------------------------

--
-- Structure de la table `depots`
--

CREATE TABLE `depots` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nomd` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `depots`
--

INSERT INTO `depots` (`id`, `nomd`, `created_at`, `updated_at`) VALUES
(1, 'Diakhaye', '2022-10-26 12:19:12', '2022-10-26 12:19:12');

-- --------------------------------------------------------

--
-- Structure de la table `depot_produits`
--

CREATE TABLE `depot_produits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `produit_id` bigint(20) UNSIGNED NOT NULL,
  `depot_id` bigint(20) UNSIGNED NOT NULL,
  `stock` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `depot_produits`
--

INSERT INTO `depot_produits` (`id`, `produit_id`, `depot_id`, `stock`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 0, '2022-10-26 12:19:52', '2022-12-06 21:45:06'),
(2, 2, 1, 178, '2022-10-30 21:32:14', '2022-12-06 18:30:59'),
(3, 3, 1, 0, '2022-10-30 21:49:30', '2022-10-30 21:49:30'),
(4, 4, 1, 0, '2022-10-30 21:51:00', '2022-10-30 21:51:00'),
(5, 5, 1, 0, '2022-10-30 21:54:01', '2022-10-30 21:57:34');

-- --------------------------------------------------------

--
-- Structure de la table `entrees`
--

CREATE TABLE `entrees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `produit_id` bigint(20) UNSIGNED NOT NULL,
  `quantite` int(11) NOT NULL,
  `prixu` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `facturee_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `entrees`
--

INSERT INTO `entrees` (`id`, `produit_id`, `quantite`, `prixu`, `created_at`, `updated_at`, `facturee_id`) VALUES
(9, 1, 20, 700, '2022-10-26 12:24:00', '2022-10-30 21:52:08', 4),
(10, 2, 100, 500, '2022-10-30 21:32:36', '2022-10-30 21:32:36', 5),
(11, 2, 100, 500, '2022-10-30 21:43:22', '2022-10-30 21:43:22', 6),
(12, 5, 1, 58000, '2022-10-30 21:54:37', '2022-10-30 21:54:37', 7);

-- --------------------------------------------------------

--
-- Structure de la table `facturees`
--

CREATE TABLE `facturees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `depot_id` bigint(20) UNSIGNED NOT NULL,
  `fournisseur_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `facturees`
--

INSERT INTO `facturees` (`id`, `depot_id`, `fournisseur_id`, `created_at`, `updated_at`) VALUES
(4, 1, 9, '2022-10-26 12:24:00', '2022-10-26 12:24:00'),
(5, 1, 1, '2022-10-30 21:32:36', '2022-10-30 21:32:36'),
(6, 1, 9, '2022-10-30 21:43:22', '2022-10-30 21:43:22'),
(7, 1, 1, '2022-10-30 21:54:37', '2022-10-30 21:54:37');

-- --------------------------------------------------------

--
-- Structure de la table `factures`
--

CREATE TABLE `factures` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `depot_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `factures`
--

INSERT INTO `factures` (`id`, `depot_id`, `client_id`, `created_at`, `updated_at`) VALUES
(3, 1, 1, '2022-10-26 12:35:39', '2022-10-26 12:35:39'),
(4, 1, 1, '2022-10-26 12:36:44', '2022-10-26 12:36:44'),
(5, 1, 2, '2022-10-30 21:31:10', '2022-10-30 21:31:10'),
(6, 1, 9, '2022-10-30 21:45:07', '2022-10-30 21:45:07'),
(7, 1, 1, '2022-10-30 21:56:09', '2022-10-30 21:56:09'),
(8, 1, 1, '2022-10-30 21:57:34', '2022-10-30 21:57:34'),
(9, 1, 1, '2022-10-30 21:59:06', '2022-10-30 21:59:06'),
(10, 1, 1, '2022-12-06 18:26:54', '2022-12-06 18:26:54'),
(11, 1, 1, '2022-12-06 18:30:59', '2022-12-06 18:30:59'),
(12, 1, 1, '2022-12-06 21:44:35', '2022-12-06 21:44:35'),
(13, 1, 1, '2022-12-06 21:45:06', '2022-12-06 21:45:06');

-- --------------------------------------------------------

--
-- Structure de la table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `fournisseurs`
--

CREATE TABLE `fournisseurs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nomf` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telf` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `fournisseurs`
--

INSERT INTO `fournisseurs` (`id`, `nomf`, `telf`, `created_at`, `updated_at`) VALUES
(1, 'PATISEN', '338959450', '2022-05-29 18:37:36', '2022-05-29 18:38:10'),
(2, 'CMGA', '330000000', '2022-06-11 12:56:18', '2022-06-11 12:56:18'),
(3, 'MERHWED', '773334949', '2022-06-25 17:27:23', '2022-06-25 17:27:23'),
(4, 'NESTLE', '771244949', '2022-06-25 17:29:11', '2022-06-25 17:29:11'),
(5, 'SONACOS', '330000000', '2022-06-25 17:44:28', '2022-06-25 17:44:28'),
(7, 'ergrgrg', '778900890', '2022-07-07 16:43:43', '2022-07-07 16:43:43'),
(8, 'HED', '330000000', '2022-07-30 17:24:27', '2022-07-30 17:24:27'),
(9, 'Ibra', '774874628', '2022-07-30 17:46:40', '2022-07-30 17:46:40');

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2022_05_29_144215_create_fournisseurs_table', 1),
(5, '2022_05_29_144513_create_produits_table', 1),
(6, '2022_05_29_144612_create_depots_table', 1),
(7, '2022_05_29_144716_create_depot_produits_table', 1),
(9, '2022_05_29_144805_create_clients_table', 1),
(12, '2022_06_13_093634_update_table_users_add_column_role', 3),
(13, '2022_06_13_214112_update_table_entree_add_column_facture', 4),
(14, '2022_06_13_214220_update_table_sorties_add_column_facture', 4),
(16, '2022_06_16_203930_create_transferts_table', 6),
(17, '2022_06_21_214519_create_chahffeurs_table', 7),
(18, '2022_06_22_100830_create_table_add_column_chauffeur_', 8),
(19, '2022_06_23_230819_update_table_sorties_add_column_chauffeur_id', 9),
(20, '2022_06_23_230903_update_table_entree_add_column_chauffeur_id', 9),
(22, '2022_05_29_144825_create_sorties_table', 11),
(23, '2022_06_14_110835_create_retours_table', 11),
(29, '2022_06_30_200652_create_factures_table', 13),
(32, '2022_07_01_154022_create_table_facturees', 14),
(33, '2022_05_29_144746_create_entrees_table', 15),
(34, '2022_07_01_162729_update_table_add_column_in_entrees', 15),
(35, '2022_07_01_215852_update_table_transferts_add_colum', 16),
(36, '2022_06_30_214727_update_table_add_column_in_sorties', 15),
(37, '2022_07_01_154022_create_table_facturees', 15),
(38, '2022_07_01_162729_update_table_add_column_in_entrees', 15),
(39, '2022_12_04_133452_create_categories_table', 17),
(40, '2022_12_06_145339_update_table_produit_add_column_categorie_id', 18);

-- --------------------------------------------------------

--
-- Structure de la table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `produits`
--

CREATE TABLE `produits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nomp` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prixu` double NOT NULL,
  `unite` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `categorie_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `produits`
--

INSERT INTO `produits` (`id`, `nomp`, `prixu`, `unite`, `created_at`, `updated_at`, `categorie_id`) VALUES
(1, 'Ecouteur Iphone', 700, 'piece', '2022-10-26 12:19:52', '2022-12-06 15:42:10', 1),
(2, 'BLINDE', 500, 'piece', '2022-10-30 21:32:14', '2022-10-30 21:32:14', NULL),
(3, 'BLINDE', 500, 'piece', '2022-10-30 21:49:30', '2022-10-30 21:49:30', NULL),
(4, 'ECOUTEUR', 500, 'piece', '2022-10-30 21:51:00', '2022-10-30 21:51:00', NULL),
(5, 'TELEPHONE TECNO', 58000, 'piece', '2022-10-30 21:54:01', '2022-10-30 21:54:01', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `retours`
--

CREATE TABLE `retours` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `quantite` double NOT NULL,
  `sortie_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `retours`
--

INSERT INTO `retours` (`id`, `quantite`, `sortie_id`, `created_at`, `updated_at`) VALUES
(3, 1, 14, '2022-10-30 21:56:45', '2022-10-30 21:56:45');

-- --------------------------------------------------------

--
-- Structure de la table `sorties`
--

CREATE TABLE `sorties` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `produit_id` bigint(20) UNSIGNED NOT NULL,
  `prixv` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `facture_id` bigint(20) UNSIGNED NOT NULL,
  `quantite` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `sorties`
--

INSERT INTO `sorties` (`id`, `produit_id`, `prixv`, `created_at`, `updated_at`, `facture_id`, `quantite`) VALUES
(11, 1, 10000, '2022-10-26 12:36:44', '2022-10-26 12:36:44', 4, 10),
(12, 1, 1000, '2022-10-30 21:31:10', '2022-10-30 21:31:10', 5, 1),
(13, 1, 1000, '2022-10-30 21:45:07', '2022-10-30 21:45:07', 6, 1),
(14, 5, 65000, '2022-10-30 21:56:09', '2022-10-30 21:56:45', 7, 0),
(15, 5, 65000, '2022-10-30 21:57:34', '2022-10-30 21:57:34', 8, 1),
(16, 2, 1200, '2022-10-30 21:59:06', '2022-10-30 22:03:22', 9, 12),
(17, 1, 20000, '2022-12-06 18:26:54', '2022-12-06 18:26:54', 10, 2),
(18, 2, 1500, '2022-12-06 18:30:59', '2022-12-06 18:30:59', 11, 10),
(19, 1, 2500, '2022-12-06 21:44:35', '2022-12-06 21:44:35', 12, 3),
(20, 1, 2500, '2022-12-06 21:45:06', '2022-12-06 21:45:06', 13, 3);

-- --------------------------------------------------------

--
-- Structure de la table `transferts`
--

CREATE TABLE `transferts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `produit_id` bigint(20) UNSIGNED NOT NULL,
  `depot_id` bigint(20) UNSIGNED NOT NULL,
  `destinataire_id` bigint(20) UNSIGNED NOT NULL,
  `quantite` double NOT NULL,
  `destinataire` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `valide` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `transferts`
--

INSERT INTO `transferts` (`id`, `produit_id`, `depot_id`, `destinataire_id`, `quantite`, `destinataire`, `created_at`, `updated_at`, `valide`) VALUES
(1, 2, 1, 2, 20, 'Yarakh', '2022-06-18 09:08:06', '2022-07-22 22:47:33', 1),
(2, 2, 1, 2, 20, 'Yarakh', '2022-06-25 12:42:48', '2022-06-25 12:42:48', 0),
(3, 2, 1, 5, 2500, 'Sedipal Nestle', '2022-06-25 18:18:21', '2022-06-25 18:18:21', 0),
(4, 2, 1, 4, 100, 'CDN', '2022-07-04 16:08:44', '2022-07-04 16:31:34', 1),
(5, 8, 4, 3, 95, 'SOTIBA', '2022-07-30 18:31:48', '2022-07-30 18:34:53', 1),
(6, 8, 3, 4, 30, 'CDN', '2022-07-30 18:40:01', '2022-07-30 18:40:51', 1);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `depot_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role`, `remember_token`, `created_at`, `updated_at`, `depot_id`) VALUES
(1, 'Ibra Ndiaye', 'ibra789ndiaye@gmail.com', NULL, '$2y$10$yUroUalM79YVaf3sPYVgM.0vQQ3smZT9217ti.cP3gXZdcwpgZsum', 'administrateur', NULL, '2022-06-06 16:58:08', '2022-10-26 12:33:53', 1),
(2, 'fall demba', 'ibra93_3@live.fr', NULL, '$2y$10$tnUBqnLSTkFrCrhleGFjkO4qNZr5XtS3gR4NL.TYZu8VmYp5CRS7a', 'gestionnaire', NULL, '2022-06-06 22:38:38', '2022-06-07 16:31:26', 1),
(3, 'Mamadou Diop', 'mamadou@sedipal.sn', NULL, '$2y$10$XvepKFNBNRZPRn0e4DMcQeREVFGSfi2LeF.k9f77VOd4/8Vm8Fo5W', 'gestionnaire', NULL, '2022-06-25 18:04:19', '2022-06-25 18:09:43', 5),
(5, 'CDN D épot', 'cdn@sedipal.sn', NULL, '$2y$10$K6sl9vld9Oz3YGSmI9mTsOQ01cW/7Jd0dplzzUVhTFKqYnAI/jl5K', 'gestionnaire', NULL, '2022-07-04 16:15:45', '2022-07-04 16:15:45', 4),
(6, 'Yarakh', 'yarakh@sedipal.sn', NULL, '$2y$10$WbfcNlJy4w0DBUsz2U5D8OqBOGq0AiRnrdnZpxxkthkm98fFDGdTu', 'gestionnaire', NULL, '2022-07-22 22:38:07', '2022-07-22 22:38:07', 2),
(7, 'Sotiba', 'sotiba@sedipal.sn', NULL, '$2y$10$SkRjBDDdDoNYQMIhxq4sweMNTD5I9xT6p6YVCUODOPRrw7K5kg0lq', 'gestionnaire', NULL, '2022-07-30 18:34:01', '2022-07-30 18:34:01', 3);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `depots`
--
ALTER TABLE `depots`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `depot_produits`
--
ALTER TABLE `depot_produits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `depot_produits_produit_id_foreign` (`produit_id`),
  ADD KEY `depot_produits_depot_id_foreign` (`depot_id`);

--
-- Index pour la table `entrees`
--
ALTER TABLE `entrees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entrees_produit_id_foreign` (`produit_id`),
  ADD KEY `entrees_facturee_id_foreign` (`facturee_id`);

--
-- Index pour la table `facturees`
--
ALTER TABLE `facturees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `facturees_depot_id_foreign` (`depot_id`),
  ADD KEY `facturees_fournisseur_id_foreign` (`fournisseur_id`);

--
-- Index pour la table `factures`
--
ALTER TABLE `factures`
  ADD PRIMARY KEY (`id`),
  ADD KEY `factures_depot_id_foreign` (`depot_id`),
  ADD KEY `factures_client_id_foreign` (`client_id`);

--
-- Index pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `fournisseurs`
--
ALTER TABLE `fournisseurs`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Index pour la table `produits`
--
ALTER TABLE `produits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `produits_categorie_id_foreign` (`categorie_id`);

--
-- Index pour la table `retours`
--
ALTER TABLE `retours`
  ADD PRIMARY KEY (`id`),
  ADD KEY `retours_sortie_id_foreign` (`sortie_id`);

--
-- Index pour la table `sorties`
--
ALTER TABLE `sorties`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sorties_produit_id_foreign` (`produit_id`),
  ADD KEY `sorties_facture_id_foreign` (`facture_id`);

--
-- Index pour la table `transferts`
--
ALTER TABLE `transferts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transferts_produit_id_foreign` (`produit_id`),
  ADD KEY `transferts_depot_id_foreign` (`depot_id`),
  ADD KEY `transferts_destinataire_id_foreign` (`destinataire_id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_depot_id_foreign` (`depot_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `depots`
--
ALTER TABLE `depots`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `depot_produits`
--
ALTER TABLE `depot_produits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `entrees`
--
ALTER TABLE `entrees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `facturees`
--
ALTER TABLE `facturees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `factures`
--
ALTER TABLE `factures`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `fournisseurs`
--
ALTER TABLE `fournisseurs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT pour la table `produits`
--
ALTER TABLE `produits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `retours`
--
ALTER TABLE `retours`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `sorties`
--
ALTER TABLE `sorties`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT pour la table `transferts`
--
ALTER TABLE `transferts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `depot_produits`
--
ALTER TABLE `depot_produits`
  ADD CONSTRAINT `depot_produits_depot_id_foreign` FOREIGN KEY (`depot_id`) REFERENCES `depots` (`id`),
  ADD CONSTRAINT `depot_produits_produit_id_foreign` FOREIGN KEY (`produit_id`) REFERENCES `produits` (`id`);

--
-- Contraintes pour la table `entrees`
--
ALTER TABLE `entrees`
  ADD CONSTRAINT `entrees_facturee_id_foreign` FOREIGN KEY (`facturee_id`) REFERENCES `facturees` (`id`),
  ADD CONSTRAINT `entrees_produit_id_foreign` FOREIGN KEY (`produit_id`) REFERENCES `produits` (`id`);

--
-- Contraintes pour la table `facturees`
--
ALTER TABLE `facturees`
  ADD CONSTRAINT `facturees_depot_id_foreign` FOREIGN KEY (`depot_id`) REFERENCES `depots` (`id`),
  ADD CONSTRAINT `facturees_fournisseur_id_foreign` FOREIGN KEY (`fournisseur_id`) REFERENCES `fournisseurs` (`id`);

--
-- Contraintes pour la table `factures`
--
ALTER TABLE `factures`
  ADD CONSTRAINT `factures_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`),
  ADD CONSTRAINT `factures_depot_id_foreign` FOREIGN KEY (`depot_id`) REFERENCES `depots` (`id`);

--
-- Contraintes pour la table `produits`
--
ALTER TABLE `produits`
  ADD CONSTRAINT `produits_categorie_id_foreign` FOREIGN KEY (`categorie_id`) REFERENCES `categories` (`id`);

--
-- Contraintes pour la table `retours`
--
ALTER TABLE `retours`
  ADD CONSTRAINT `retours_sortie_id_foreign` FOREIGN KEY (`sortie_id`) REFERENCES `sorties` (`id`);

--
-- Contraintes pour la table `sorties`
--
ALTER TABLE `sorties`
  ADD CONSTRAINT `sorties_facture_id_foreign` FOREIGN KEY (`facture_id`) REFERENCES `factures` (`id`),
  ADD CONSTRAINT `sorties_produit_id_foreign` FOREIGN KEY (`produit_id`) REFERENCES `produits` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
