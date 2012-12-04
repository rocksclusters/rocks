#SubModule=" core/alpha/.git core/area51/.git core/backup/.git core/base/.git core/bio/.git core/condor/.git core/cvs-server/.git core/ganglia/.git core/git/.git core/hpc/.git core/java/.git core/jumpstart/.git core/kernel-org/.git core/kernel/.git core/kvm/.git core/os/.git core/perl/.git core/postgres8/.git core/python/.git core/restore/.git core/service-pack/.git core/sge/.git core/sun-ct/.git core/viz/.git core/web-server/.git core/xen/.git core/zfs-linux/.git"
SubModule=" core/base/.git core/condor/.git core/ganglia/.git core/hpc/.git core/java/.git core/kernel/.git core/kvm/.git core/os/.git core/perl/.git"


for module in $SubModule;
do 
    modName=`echo $module|awk -F / '{print $2}'`
    echo 
    git submodule add http://git.rocksclusters.org/git/$module src/roll/$modName
    git commit -m "Adding submodule $modName"
done

