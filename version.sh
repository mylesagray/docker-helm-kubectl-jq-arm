fetch() {
  local url=$1

  if type "curl" > /dev/null; then
    curl -Ls $url
  elif type "wget" > /dev/null; then
    wget $url -O - 2>&1
  fi
}

get_latest_helm() {
  local TAG
  local latest_release_url="https://github.com/helm/helm/releases"
  TAG=$(fetch $latest_release_url | grep 'href="/helm/helm/releases/tag/v3.' | grep -v no-underline | head -n 1 | cut -d '"' -f 2 | awk '{n=split($NF,a,"/");print a[n]}' | awk 'a !~ $0{print}; {a=$0}')
  echo $TAG
}

get_latest_kubectl() {
  fetch "https://storage.googleapis.com/kubernetes-release/release/stable.txt"
}

# Parse args (if any)
set -u
while [[ $# -gt 0 ]]; do
  case $1 in
    'helm')
      get_latest_helm
      ;;
    'kubectl')
      get_latest_kubectl
      ;;
    *) exit 1
      ;;
  esac
  shift
done
set +u
