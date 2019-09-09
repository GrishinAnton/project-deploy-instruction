const deplotToPath =
  process.env.CIRCLE_BRANCH === 'add-deploy'
    ? '/var/www/host'
    : '/var/www/host';

module.exports = shipit => {
  require('shipit-deploy')(shipit);
  shipit.initConfig({
    default: {
      workspace: '/home/circleci/repo/tmp',
      servers: 'address@server',
      key: 'path',
      strict: 'no',
      keepReleases: 10,
      deployTo: deplotToPath,
      dirToCopy: '/home/circleci/repo/src/frontend/admin/dist',
      rsyncFrom: '/home/circleci/repo/',
      repositoryUrl: 'url',
      branch: 'add-deploy',
    },
  });
  // shipit.task('deploy', async () => {
  //     await shipit.copyToRemote('Modules/Career/build', '/var/www/talents/');
  // });
};   
