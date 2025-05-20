-- CreateTable
CREATE TABLE `clinics` (
    `id` VARCHAR(191) NOT NULL,
    `name` VARCHAR(191) NOT NULL,
    `email` VARCHAR(191) NOT NULL,
    `password` VARCHAR(191) NOT NULL,
    `phone` VARCHAR(191) NOT NULL,
    `address` VARCHAR(191) NOT NULL,
    `logo` VARCHAR(191) NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL,

    UNIQUE INDEX `clinics_email_key`(`email`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `users` (
    `id` VARCHAR(191) NOT NULL,
    `clinic_id` VARCHAR(191) NOT NULL,
    `name` VARCHAR(191) NOT NULL,
    `email` VARCHAR(191) NOT NULL,
    `password` VARCHAR(191) NOT NULL,
    `role` VARCHAR(191) NOT NULL DEFAULT 'user',
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL,

    UNIQUE INDEX `users_email_key`(`email`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `pets` (
    `id` VARCHAR(191) NOT NULL,
    `clinic_id` VARCHAR(191) NOT NULL,
    `name` VARCHAR(191) NOT NULL,
    `species` VARCHAR(191) NOT NULL,
    `breed` VARCHAR(191) NOT NULL,
    `gender` VARCHAR(191) NOT NULL,
    `age` VARCHAR(191) NOT NULL,
    `color` VARCHAR(191) NOT NULL,
    `owner_name` VARCHAR(191) NOT NULL,
    `owner_phone` VARCHAR(191) NOT NULL,
    `photo` VARCHAR(191) NULL,
    `observations` TEXT NULL,
    `lost_status` BOOLEAN NOT NULL DEFAULT false,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `documents` (
    `id` VARCHAR(191) NOT NULL,
    `pet_id` VARCHAR(191) NOT NULL,
    `name` VARCHAR(191) NOT NULL,
    `file_path` VARCHAR(191) NOT NULL,
    `file_type` VARCHAR(191) NOT NULL,
    `uploaded_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `appointments` (
    `id` VARCHAR(191) NOT NULL,
    `pet_id` VARCHAR(191) NULL,
    `clinic_id` VARCHAR(191) NOT NULL,
    `date_time` DATETIME(3) NOT NULL,
    `pet_name` VARCHAR(191) NOT NULL,
    `owner_name` VARCHAR(191) NOT NULL,
    `owner_phone` VARCHAR(191) NOT NULL,
    `status` VARCHAR(191) NOT NULL DEFAULT 'pending',
    `notes` TEXT NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `users` ADD CONSTRAINT `users_clinic_id_fkey` FOREIGN KEY (`clinic_id`) REFERENCES `clinics`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `pets` ADD CONSTRAINT `pets_clinic_id_fkey` FOREIGN KEY (`clinic_id`) REFERENCES `clinics`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `documents` ADD CONSTRAINT `documents_pet_id_fkey` FOREIGN KEY (`pet_id`) REFERENCES `pets`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `appointments` ADD CONSTRAINT `appointments_clinic_id_fkey` FOREIGN KEY (`clinic_id`) REFERENCES `clinics`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `appointments` ADD CONSTRAINT `appointments_pet_id_fkey` FOREIGN KEY (`pet_id`) REFERENCES `pets`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;
