pipelineJob('pipelineJob') {
    definition {
        cps {
            script(readFileFromWorkspace('pipelineJob.groovy'))
            sandbox()
        }
    }
}

pipelineJob('pokemon-job') {
    tools {
        maven 'M3'
    }
    definition {
        cpsScm {
            scm {
                git {
                    remote {
                        url 'https://github.com/ianguuima/Pokemon-Spring.git'
                    }
                    branch 'master'
                }
            }
        }
    }
}