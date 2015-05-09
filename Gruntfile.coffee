# Generated on 2014-07-06 using generator-angular 0.9.1
try
  config = require './config.json'
catch e
  config = {}
  console.log 'local config file now found, will try environment'

module.exports = (grunt) ->

  # Load grunt tasks automatically
  require('load-grunt-tasks')(grunt)

  # Time how long tasks take. Can help when optimizing build times
  require('time-grunt')(grunt)

  # Define the configuration for all the tasks
  grunt.initConfig({

  # Project settings
    dir:
      app: 'src'
      dist: 'out'
      test: 'test'

    aws_s3:
      options:
        accessKeyId: process.env.AWS_ACCESS_KEY_ID || config.accessKeyId
        secretAccessKey: process.env.AWS_SECRET_KEY || config.secretAccessKey
        region: 'us-east-1'
      deploy:
        options:
          bucket: process.env.AWS_BUCKET_NAME || config.bucketName
          differential: true
        files: [{
          action: 'upload'
          expand: true
          cwd: '<%= dir.dist %>'
          src: ['**']
          dest: '/'
        }]

    concurrent:
      server: ['shell:serve', 'watch']
      options:
        logConcurrentOutput: true

    shell:
      serve:
        command: 'docpad run'
      generate:
        command: 'docpad generate'

    watch:
      render:
        files: ['<%= dir.app %>/render/**/**'],
        tasks: ['shell:generate'],
  })

  grunt.registerTask 'default', [
    'concurrent:server'
  ]

  grunt.registerTask 'deploy', [
    'shell:generate'
    'aws_s3'
  ]
