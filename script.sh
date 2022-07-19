cp -r ../../../../ECLAIR/* ./

cd ECLAIR
# Prepare for build
../prepare.sh Debug
# Analyze the project
./analyze.sh MC3 CRC_16
# Make the directory for ECLAIR project database
mkdir -p ~/github/$CI_PROJECT_PATH/$CI_JOB_ID && rm -f ~/github/$CI_PROJECT_PATH/last_$CI_COMMIT_BRANCH && ln -s ~/github/$CI_PROJECT_PATH/$CI_JOB_ID ~/github/$CI_PROJECT_PATH/last_$CI_COMMIT_BRANCH
# Copy the project database
scp out_CRC_16_Release_MC3/.data/PROJECT.ecd ~/github/$CI_PROJECT_PATH/$CI_JOB_ID
# Publish ECLAIR report link
echo "https://eclairit.com:3787/fs/home/emelin/github/$CI_PROJECT_PATH/$CI_JOB_ID/PROJECT.ecd"
cp report.sarif out_CRC_16_Release_MC3/reports
#Create the ECLAIR badge
anybadge --label=ECLAIR --value=default --file=badge.svg
