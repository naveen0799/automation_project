 pipeline {
    agent any

environment {
		

        def prod = "cd /home/ubuntu/automation_project && \
            sudo docker volume prune -f && sudo docker system prune -af && sudo docker-compose down && sudo docker-compose pull && sudo docker-compose up -d && sudo docker ps --latest && \
            pwd "
        def discordURL = 'https://discordapp.com/api/webhooks/1106891112418914385/NfZ6sa6p5uVujQGyf1jMM72wF5lrrYFE2wqjMZgtno9eMglU8tqduc-cWTImY_cms3y7'
        // URL of image png/jpg to place to right of Discord build notifications
        def discordTImage = 'http://assets.stickpng.com/images/58480984cef1014c0b5e4902.png'    
        def discordImage = 'https://www.nicepng.com/png/full/362-3624869_icon-success-circle-green-tick-png.png'
        def discordDesc = "description\n"
        def discordFooter = "footer desc with vars: ${JOB_BASE_NAME}` (build #${BUILD_NUMBER})`  (tag #${BUILD_TAG})"
        def discordTitle = "${BUILD_NAME} (devel)"
        def username = "Jenkins-Bot"
        def tag = "${BUILD_TAG}"
        def jobBaseName = "${env.JOB_NAME}".split('/').first()
    
	}


    post {
    always {
    // discordSend description: "Jenkins Pipeline Build $JOB_BASE_NAME",  footer: " Build Started for ${JOB_NAME} ", link: "$BUILD_URL", result: currentBuild.result, title: "${JOB_NAME}", webhookURL: "https://discord.com/api/webhooks/948167009454161940/1MxQQdk0W84GMMm0S4gaT8Gy8bLKfb-yf5yZluH9p1CxRO3szrWid3spmwZYwCaZCC7E"
        script{
            if ("$JOB_BASE_NAME" == 'main' || "$JOB_BASE_NAME" == 'master') {
            
                    discordSend webhookURL: discordURL,
                    title: "${JOB_BASE_NAME} #${BUILD_NUMBER}",
                    // title: discordTitle,
                    link: "$BUILD_URL",
                    result: currentBuild.currentResult ,
                    description: "**Pipeline:** ${jobBaseName}  \n**Build:** ${env.BUILD_NUMBER}  \n**Status:** ${currentBuild.currentResult }\n\u2060",  /* word joiner character forces a blank line */
                    // enableArtifactsList: true,
                    showChangeset: true,
                    thumbnail: discordTImage,
                    unstable: true,
                    customAvatarUrl: discordTImage,
                    customUsername: username,
                    notes: "Hello, <#918828067110158336> Team! \n**${jobBaseName}**  --> ${JOB_BASE_NAME}  is  Successfully Deployed.",
                    footer: discordFooter
                    // image: discordImage
                    }else {
                    
                }
        }
  
    }
  }
    stages {

        // Devlopment Stages

        stage('Building Docker image For Main Project-Frontend') {
            when {
                branch 'main'
            }

                    // footer: discordFooter
                    // image: discordImage
        

            steps {

                script{           
                    discordSend webhookURL: discordURL,
                    color: 'green',
                    title: "Hello, **Beumont** Team!",
                    // title: discordTitle,
                    link: "$BUILD_URL",
                    result: currentBuild.currentResult ,
                    description: "**Pipeline:** ${jobBaseName}  \n**Build:** ${env.BUILD_NUMBER}  \n**Status:** Started\n\u2060",  /* word joiner character forces a blank line */
                    // enableArtifactsList: false,
                    // showChangeset: true,
                    thumbnail: discordTImage,
                    unstable: true,
                    customAvatarUrl: discordTImage,
                    customUsername: username}

                sh """cat  Dockerfile"""
                
                sh """cat  docker-compose.yml"""

                sh """ docker-compose build"""

                sh """ echo "Build Succesfully" """

            }
        }





        stage('Building Master Container') {
            when {
                branch 'main'
            }
            steps {

             sshagent(['SERVER']) {
                 sh "ssh -o StrictHostKeyChecking=no -l ubuntu 15.206.125.7  'whoami'"
                 sh "ssh -o StrictHostKeyChecking=no -l ubuntu 15.206.125.7  '${prod}'"


                    }
         }
        }



    }

}
