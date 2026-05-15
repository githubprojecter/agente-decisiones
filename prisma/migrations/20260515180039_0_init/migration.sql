-- CreateTable
CREATE TABLE `User` (
    `id` VARCHAR(191) NOT NULL,
    `name` VARCHAR(191) NULL,
    `email` VARCHAR(191) NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    UNIQUE INDEX `User_email_key`(`email`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Objective` (
    `id` VARCHAR(191) NOT NULL,
    `userId` VARCHAR(191) NOT NULL,
    `title` VARCHAR(191) NOT NULL,
    `description` TEXT NULL,
    `status` ENUM('ACTIVE', 'COMPLETED', 'PAUSED', 'CANCELED') NOT NULL DEFAULT 'ACTIVE',
    `period` ENUM('DAILY', 'WEEKLY', 'MONTHLY', 'CUSTOM') NOT NULL DEFAULT 'WEEKLY',
    `startsAt` DATETIME(3) NULL,
    `endsAt` DATETIME(3) NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    INDEX `Objective_userId_idx`(`userId`),
    INDEX `Objective_status_idx`(`status`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `AgentConversation` (
    `id` VARCHAR(191) NOT NULL,
    `userId` VARCHAR(191) NOT NULL,
    `elevenlabsConversationId` VARCHAR(191) NULL,
    `elevenlabsAgentId` VARCHAR(191) NOT NULL,
    `title` VARCHAR(191) NULL,
    `transcript` LONGTEXT NULL,
    `metadata` LONGTEXT NULL,
    `summary` TEXT NULL,
    `nextStep` TEXT NULL,
    `status` ENUM('OPEN', 'CLOSED', 'SUMMARIZED') NOT NULL DEFAULT 'OPEN',
    `startedAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `endedAt` DATETIME(3) NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    UNIQUE INDEX `AgentConversation_elevenlabsConversationId_key`(`elevenlabsConversationId`),
    INDEX `AgentConversation_userId_idx`(`userId`),
    INDEX `AgentConversation_elevenlabsAgentId_idx`(`elevenlabsAgentId`),
    INDEX `AgentConversation_status_idx`(`status`),
    INDEX `AgentConversation_startedAt_idx`(`startedAt`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `AgentMemory` (
    `id` VARCHAR(191) NOT NULL,
    `userId` VARCHAR(191) NOT NULL,
    `type` ENUM('PROFILE', 'OBJECTIVE', 'PREFERENCE', 'SUMMARY', 'WARNING', 'DECISION') NOT NULL,
    `content` TEXT NOT NULL,
    `source` VARCHAR(191) NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    INDEX `AgentMemory_userId_idx`(`userId`),
    INDEX `AgentMemory_type_idx`(`type`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `AgentTask` (
    `id` VARCHAR(191) NOT NULL,
    `userId` VARCHAR(191) NOT NULL,
    `objectiveId` VARCHAR(191) NULL,
    `title` VARCHAR(191) NOT NULL,
    `description` TEXT NULL,
    `priority` ENUM('HIGH', 'MEDIUM', 'LOW', 'ELIMINATE') NOT NULL DEFAULT 'MEDIUM',
    `status` ENUM('PENDING', 'IN_PROGRESS', 'DONE', 'CANCELED') NOT NULL DEFAULT 'PENDING',
    `dueDate` DATETIME(3) NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    INDEX `AgentTask_userId_idx`(`userId`),
    INDEX `AgentTask_objectiveId_idx`(`objectiveId`),
    INDEX `AgentTask_status_idx`(`status`),
    INDEX `AgentTask_priority_idx`(`priority`),
    INDEX `AgentTask_dueDate_idx`(`dueDate`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Objective` ADD CONSTRAINT `Objective_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `AgentConversation` ADD CONSTRAINT `AgentConversation_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `AgentMemory` ADD CONSTRAINT `AgentMemory_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `AgentTask` ADD CONSTRAINT `AgentTask_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `AgentTask` ADD CONSTRAINT `AgentTask_objectiveId_fkey` FOREIGN KEY (`objectiveId`) REFERENCES `Objective`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;
