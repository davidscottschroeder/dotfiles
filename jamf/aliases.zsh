alias vpn=jamf-vpn
alias jp='pushd ~/Projects/jamf/jamf-pro/jamf-pro-server'
alias eks='kubectx eks'
alias stash='stash-cli'

function switch_jdk() {
    local wanted_java_version=$1
    export JAVA_HOME=`/usr/libexec/java_home -F -v $wanted_java_version -a x86_64 -d64`
    echo "export JAVA_HOME=${JAVA_HOME}" > ~/.mavenrc
    echo "mvn now using : "
    mvn --version
    # cleaned PATH
    export PATH=$(echo $PATH | sed -E "s,(/System)?/Library/Java/JavaVirtualMachines/[a-zA-Z0-9._]+/Contents/Home/bin:,,g")
    # prepend wanted JAVA_HOME
    export PATH=$JAVA_HOME/bin:$PATH
    echo "Java now using : "
    java -version
    clear
}

fleet-evict() {
    kubectx fleet
    kubectl delete po -n fleet $(kubectl get po -n fleet | grep -i evict | awk '{print $1}')
}
