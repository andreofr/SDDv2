#!/usr/bin/env groovy

parameters {
        string(
            name: 'project_name', 
            defaultValue: 'TEST', 
            description: 'Nom du projet', )
        choice(
            name: 'environnement',
            choices: 'qualif',
            description: 'Environnement exécution')
}

node('Ansible') {
  try { 

    def workspace = pwd()
    sh "echo '${workspace}'"
     

    stage('Preparation') {
       git(
         url: 'http://vcs.dev.n18.an.cnav/SDD/SDDv2.git'
       )
       
       dir('SDDv2_auto') {
         def fileContents = readFile file: "ansible.cfg"
         fileContents = fileContents.replace("environnement", "${environnement}")
         echo fileContents
         writeFile file: "ansible.cfg", text: fileContents
       }
    }

    stage('Build FrontOffice & BackOffice') {
       // Run the maven build
       sh "echo 'WE ARE BUILDING'"

       dir('SDDv2_repo'){
         sh 'mvn clean package -DskipTests -P${environnement}'
       }
    }

    stage('Create Jboss instances' ) {

       dir('SDDv2_auto') {
        ansiblePlaybook(
         playbook: 'create_instances.yml',
        )
       }
    }

    stage('Configuration' ) {
       dir('SDDv2_auto') {
        ansiblePlaybook(
         playbook: 'configuration.yml',
        )
       }
    }

    stage('Deploy on' ) {
       dir('SDDv2_auto') {
        ansiblePlaybook(
         playbook: 'deploy_apps.yml',
        )
       }
    }

    stage('Results') {
       sh "echo 'Results'"
    }

  } catch(error) {
      throw error
  } finally {
//      sh "echo 'suppression du workspace'"
//      deleteDir()
  }

}
