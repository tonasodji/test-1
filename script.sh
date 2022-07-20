cp -r ../../../../ECLAIR/* ./

cd ECLAIR
# Prepare for build
../prepare.sh Debug
# Analyze the project
./analyze.sh MC3 CRC_16
# Make the directory for ECLAIR project database
mkdir -p ~/github/$GITHUB_REPOSITORY/$GITHUB_RUN_NUMBER && rm -f ~/github/$GITHUB_REPOSITORY/last_$GITHUB_REF && ln -s ~/github/$GITHUB_REPOSITORY/$GITHUB_RUN_NUMBER ~/github/$GITHUB_REPOSITORY/last_$GITHUB_REF
# Copy the project database
scp out_CRC_16_Release_MC3/.data/PROJECT.ecd ~/github/$GITHUB_REPOSITORY/$GITHUB_RUN_NUMBER
# Publish ECLAIR report link
echo "https://eclairit.com:3787/fs/home/emelin/github/$GITHUB_REPOSITORY/$GITHUB_RUN_NUMBER/PROJECT.ecd"
echo "Home: ${HOME}"
echo "GITHUB_WORKFLOW: ${GITHUB_WORKFLOW}"
echo "GITHUB_ACTIONS: ${GITHUB_ACTIONS}"
echo "GITHUB_ACTOR: ${GITHUB_ACTOR}"
echo "GITHUB_REPOSITORY: ${GITHUB_REPOSITORY}"
echo "GITHUB_EVENT_NAME: ${GITHUB_EVENT_NAME}"
echo "GITHUB_WORKSPACE: ${GITHUB_WORKSPACE}"
echo "GITHUB_SHA: ${GITHUB_SHA}"
echo "GITHUB_REF: ${GITHUB_REF}"
cp report.sarif out_CRC_16_Release_MC3/reports
echo "![example workflow](https://github.com/$GITHUB_REPOSITORY/actions/workflows/analyze.yml/badge.svg)">README.md
echo "fatto"
#Create the ECLAIR badge
anybadge --label=ECLAIR --value=default --file=badge.svg

