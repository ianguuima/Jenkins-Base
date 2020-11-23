pipelineJob('pipelineJob') {
    definition {
        cps {
            script(readFileFromWorkspace('pipelineJob.groovy'))
            sandbox()
        }
    }
}

pipelineJob('pokemon-job') {
    definition {
        cpsScm {
            scm {
                git {
                    remote {
                        url 'git url here'
                    }
                    branch 'master'
                }
            }
        }
    }
}