<?php

namespace Deployer;

// Подключим основные рецепты из Deployer'а

require 'recipe/laravel.php';

ini_set('memory_limit','512M');

inventory('deployment/hosts/config.yml');

//TODO поставить url репозитория
set('repository', 'url');

set('writable_use_sudo', true); // Using sudo in writable commands?
set('writable_recursive', true); // Common for all modes
set('writable_chmod_mode', '0775');
set('default_timeout', 600);

//TODO разные хосты для деплоя
host('develop');
host('pre_production');
host('production');

$branch = getenv('CIRCLE_BRANCH');
if (!empty($branch)) {
    host('pre_production')->set('branch', $branch);
}

env('git_cache', true);

set('shared_dirs', [
    'storage/app',
    'storage/framework/cache',
    'storage/framework/sessions',
    'storage/framework/views',
    'storage/logs',
    'storage/sendpulse',
    'public/uploads',
]);

// Общие файлы. Принцип точно такой же, как с папками
// В случае с Laravel нам необходимо сделать "общим" лишь один
// файл - .env
set('shared_files', ['.env']);

//TODO кастомный сценарий
desc('Execute custom deploy scenario');
task('custom:deploy', function () {
    run('cd {{release_path}} && sudo chmod +x ./deploy.sh && sudo ./deploy.sh' , [
        'timeout' => 1800,
    ]);
});

//TODO кастомное отключение php artisan
task('custom:down', function () {
    run('{{bin/php}} {{release_path}}/artisan down --message="Извините, ведутся технические работы."');
});
task('custom:up', function () {
    run('{{bin/php}} {{release_path}}/artisan up');
});

task('deploy', [
    'deploy:info',
    'deploy:prepare',
    'deploy:lock',
    'deploy:release',
    'deploy:update_code',
    'deploy:shared',
    'deploy:vendors',
    'deploy:writable',
    'custom:down',
    'artisan:storage:link',
    'artisan:view:clear',
    //'artisan:config:cache',
    'artisan:optimize',
    'artisan:migrate',
    'artisan:db:seed',
    'custom:up',
    'custom:deploy',
    'deploy:symlink',
    'deploy:unlock',
    'cleanup',
]);
after('deploy', 'success'); 