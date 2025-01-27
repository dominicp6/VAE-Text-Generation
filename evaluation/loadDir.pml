from glob import glob
from os.path import sep, basename

def loadDir(dirName=".", suff="pdb", group=None):
        """
        Loads all files with the suffix suff (the input parameter) from the directory dirName).

        dirName:        directory path
        suff:           file suffix.  Should be simply "pdb" or "sdf" or similar.  Will accept the
                        wildcard and dot in case the user doesn't read this.  So, "*.pdb", ".pdb",
                        and "pdb" should work.  The suffix can be anything valid that PyMOL knows
                        how to natively load.
        group:          groupName to add the files to.

        example:
                # load all the PDBs in the current directory
                loadDir

                # load all SD files from /tmp
                loadDir /tmp, "sdf"

        notes:
                make sure you call this script w/o quotes around your parameters:
                        loadDir ., .pdb
                as opposed to
                        loadDir ".", "*.pdb"
                Use the former.
        """

        g = dirName + sep + "*." + suff.split(".")[-1]

        for c in glob( g ):
                cmd.load(c)

                if ( group != None ):
                        cmd.group( group, basename(c).split(".")[0], "add" )

cmd.extend('loadDir', loadDir)