PS1='\h:\W> '



set autolist



shopt -s checkwinsize



export EDITOR="emacs -nw"



alias lm='ls -lhB --color'

alias ll='ls -lhB --color'

alias ver='echo $SRT_BASE_RELEASE'

alias srt='echo $SRT_PRIVATE_CONTEXT'

alias mymake="make 2>&1 | tee compile.log | grep -A2 --color \"error\""

# alias mymake="make 2>&1 | tee compile.log | grep --color \"error\|warning\""

alias mycmake="date +\"Build Time: \"%A\\ %k:%M:%S && make -j install 2>&1 | tee compile.log | grep -A2 --color \" error\|warning\""

alias mywatch="watch -n 60 \"condor_q melashri | tail -1\""

alias latest="ls -halFt | head"

# I want to get this file (later)
#alias inspect_file='python /nova/app/users/mfrank/src/InspectFile.py -i'



alias go_nsrc='cd /nova/app/users/melashri/src'

alias go_ndata='cd /nova/ana/users/melashri/'

alias go_pnfs='cd /pnfs/nova/scratch/users/melashri/'



# NOvA Devs Repository

export DEVSREPO=svn+ssh://p-novaart@cdcvs.fnal.gov/cvs/projects/novaart-devs



function ss

{

    screen -fn -h 1000 -e ^]^]

}



function sa

{

    screen -x

}



function vs

{

    echo vncserver :73 -localhost -geometry 1920x1080

    vncserver :73 -localhost -geometry 1920x1080

}



function myninja

{

    ninja all 2>&1 | tee compile.log | grep -A2 --color " error\|warning"

    # Note: When grep fails to find anything, the build likely worked.

    if [ $? -ne 0 ]

    then ninja install | grep -v "Up-to-date"

    else

	echo "Build Failed"

    fi

    date +"Build Time: "%A" "%k:%M:%S

}



function build_mono

{

    setup_ups_cvmfs

    setup mrb

    setup ninja v1_8_2

    cd /nova/app/users/melashri/src/mono_180619_S16-09-13



    source localProducts_nova_develop_e9_s28_prof/setup

    

    cd ${MRB_BUILDDIR}

    mrbsetenv

}



function build_gen

{

    setup_ups_cvmfs

    setup mrb

    setup ninja v1_8_2

    cd /nova/app/users/melashri/src/mono_190610_S16-10-07/



    source localProducts_nova_develop_e9_s28_prof/setup

    

    cd ${MRB_BUILDDIR}

    mrbsetenv

}



function build_mono_S19

{

    source /cvmfs/fermilab.opensciencegrid.org/products/common/etc/setups.sh

    export PRODUCTS=${PRODUCTS}:/cvmfs/nova.opensciencegrid.org/externals/:/cvmfs/nova.opensciencegrid.org/pidlibs/products

    

    setup mrb

    setup ninja v1_8_2

    cd /nova/app/users/melashri/src/mono_190613_S19-06-03/



    source localProducts_nova_develop_e15_prof/setup

    

    cd ${MRB_BUILDDIR}

    mrbsetenv

}



function build_grid

{

    setup_ups_cvmfs /nova/ana/users/melashri/libs/mono_180619_S16-09-13/localProducts_nova_develop_e9_s28_prof/

    cd /nova/ana/users/melashri/libs/mono_180619_S16-09-13/build_grid



    source /nova/app/users/melashri/src/mono_180619_S16-09-13/srcs/novasoft/ups/setup_for_development -p e9:s28:grid



    echo

    echo "To Build: "

    echo "  buildtool --tee -j2 -i -I /nova/ana/users/melashri/libs/mono_180619_S16-09-13/localProducts_nova_develop_e9_s28_prof/"

}


# I am done until this point

function build_grid_gen

{

    setup_ups_cvmfs /nova/ana/users/melashri/libs/mono_190610_S16-10-07/localProducts_nova_develop_e9_s28_prof/

    cd /nova/ana/users/melashri/libs/mono_190610_S16-10-07/build_grid



    source /nova/app/users/melashri/src/mono_190610_S16-10-07/srcs/novasoft/ups/setup_for_development -p e9:s28:grid



    echo

    echo "To Build: "

    echo "  buildtool --tee -j2 -i -I /nova/ana/users/melashri/libs/mono_190610_S16-10-07/localProducts_nova_develop_e9_s28_prof/"

}



function run_mono

{

    setup_ups_cvmfs /nova/ana/users/melashri/libs/mono_180619_S16-09-13/localProducts_nova_develop_e9_s28_prof/

    setup novasoft develop -q e9:s28:prof



    cd /nova/app/users/melashri/src/mono_180619_S16-09-13

}



function run_gen

{

    setup_ups_cvmfs /nova/ana/users/melashri/libs/mono_190610_S16-10-07/localProducts_nova_develop_e9_s28_prof/

    setup novasoft develop -q e9:s28:prof



    cd /nova/app/users/melashri/src/mono_190610_S16-10-07/

}



function run_mono_S19

{

    source /cvmfs/fermilab.opensciencegrid.org/products/common/etc/setups.sh

    export PRODUCTS=${PRODUCTS}:/cvmfs/nova.opensciencegrid.org/externals/:/cvmfs/nova.opensciencegrid.org/pidlibs/products

    export PRODUCTS=${PRODUCTS}:/nova/ana/users/melashri/libs/mono_190613_S19-06-03/localProducts_nova_develop_e15_prof/



    setup novasoft develop -q e15:prof



    cd /nova/app/users/melashri/src/mono_190613_S19-06-03

}



function setup_grid

{

    setup_nova

    setup_fnal_security

}



function submit_grid

{

    cd /nova/app/users/melashri/src/mono/submit_grid



    echo "To Submit:"

    echo "  ./monogrid.sh 2>&1 | tee grid.log"

}



function submit_grid_gen

{

    cd /nova/app/users/melashri/src/gen/submit_grid



    echo "To Submit:"

    echo "  ./mcgengrid.sh 2>&1 | tee grid.log"

}



function watch_grid

{

    setup_grid

    watch -n 30 "jobsub_q --user=melashri | tail -1"

}



function get_logs

{

    setup_grid

    cd /nova/ana/users/melashri/samout/



    echo "To list available logs:"

    echo "  jobsub_fetchlog --list"

    echo

    echo "To retrieve logs:"

    echo "  jobsub_fetchlog --user=melashri --unzipdir=logs/ --jobid="

}



function setup_ups_cvmfs

{

    echo "Setting up /cvmfs/ UPS area ..."



    source /cvmfs/fermilab.opensciencegrid.org/products/common/etc/setups.sh

    export PRODUCTS=${PRODUCTS}:/cvmfs/nova.opensciencegrid.org/externals/:/cvmfs/nova.opensciencegrid.org/pidlibs/products



    # if there is an argument, add it as a local product directory

    if [ "$#" -ne 0 ]

    then

	export LOCAL_PRODUCTS=$1

	export PRODUCTS=$LOCAL_PRODUCTS:$PRODUCTS

    fi

}



function setup_ups_fermiapp

{

    echo "Setting up /grid/fermiapp/ UPS area ..."



    source /grid/fermiapp/products/nova/externals/setup



    # if there is an argument, add it as a local product directory

    if [ "$#" -ne 0 ]

    then

	export LOCAL_PRODUCTS=$1

	export PRODUCTS=$LOCAL_PRODUCTS:$PRODUCTS

    fi

}



function setup_novasoft_ups_old

{

    source /grid/fermiapp/products/nova/externals/setup



    export EXTRA_PRODUCTS=/grid/fermiapp/products/common/db:/nova/data/pidlibs/products

    export PRODUCTS=$EXTRA_PRODUCTS:$PRODUCTS

    

    # if there is an argument, add it as a local product directory

    if [ "$#" -ne 0 ]

    then

	export LOCAL_PRODUCTS=$1

	export PRODUCTS=$LOCAL_PRODUCTS:$PRODUCTS

    fi

}



function setup_novaddt

{   

    source /nova/app/home/novaddt/srtbuild/setup/setup_novaddt.sh "$@"

}



function setup_nova

{

    source /cvmfs/nova.opensciencegrid.org/novasoft/slf6/novasoft/setup/setup_nova.sh "$@"

}



function setup_nova_and_grid

{

    source /grid/fermiapp/nova/novaart/novasvn/srt/srt.sh

    export EXTERNALS=/nusoft/app/externals

    source $SRT_DIST/setup/setup_novasoft.sh "$@" 

    source $SRT_PUBLIC_CONTEXT/setup/setup_novagrid.sh "$@" 

}



function setup_samweb2xrootd

{

    kx509

    kxlist –p

    voms-proxy-init --rfc --voms=fermilab:/fermilab/nova/Role=Analysis --noregen



    source /grid/fermiapp/products/common/etc/setups.sh

    export PRODUCTS=/grid/fermiapp/products/common/db/:$PRODUCTS

    setup sam_web_client

}



function setup_proxy()

{

    location="${HOME}/.globus/usercert.pem"

    kx509 -o $location

    ls -ltrh $location

    export X509_USER_PROXY=$location

    voms-proxy-init -rfc -noregen -voms=fermilab:/fermilab/nova/Role=Analysis -cert $location

}
