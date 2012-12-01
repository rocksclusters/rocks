# $Id: Makefile,v 1.34 2012/11/27 00:47:50 phil Exp $
#
# @Copyright@
# 
# 				Rocks(r)
# 		         www.rocksclusters.org
# 		         version 5.6 (Emerald Boa)
# 		         version 6.1 (Emerald Boa)
# 
# Copyright (c) 2000 - 2013 The Regents of the University of California.
# All rights reserved.	
# 
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are
# met:
# 
# 1. Redistributions of source code must retain the above copyright
# notice, this list of conditions and the following disclaimer.
# 
# 2. Redistributions in binary form must reproduce the above copyright
# notice unmodified and in its entirety, this list of conditions and the
# following disclaimer in the documentation and/or other materials provided 
# with the distribution.
# 
# 3. All advertising and press materials, printed or electronic, mentioning
# features or use of this software must display the following acknowledgement: 
# 
# 	"This product includes software developed by the Rocks(r)
# 	Cluster Group at the San Diego Supercomputer Center at the
# 	University of California, San Diego and its contributors."
# 
# 4. Except as permitted for the purposes of acknowledgment in paragraph 3,
# neither the name or logo of this software nor the names of its
# authors may be used to endorse or promote products derived from this
# software without specific prior written permission.  The name of the
# software includes the following terms, and any derivatives thereof:
# "Rocks", "Rocks Clusters", and "Avalanche Installer".  For licensing of 
# the associated name, interested parties should contact Technology 
# Transfer & Intellectual Property Services, University of California, 
# San Diego, 9500 Gilman Drive, Mail Code 0910, La Jolla, CA 92093-0910, 
# Ph: (858) 534-5815, FAX: (858) 534-7345, E-MAIL:invent@ucsd.edu
# 
# THIS SOFTWARE IS PROVIDED BY THE REGENTS AND CONTRIBUTORS ``AS IS''
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
# THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
# PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE REGENTS OR CONTRIBUTORS
# BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
# CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
# SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
# BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
# WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
# OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN
# IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
# 
# @Copyright@
#
# $Log: Makefile,v $
# Revision 1.34  2012/11/27 00:47:50  phil
# Copyright Storm for Emerald Boa
#
# Revision 1.33  2012/05/06 05:48:04  phil
# Copyright Storm for Mamba
#
# Revision 1.32  2011/07/23 02:30:11  phil
# Viper Copyright
#
# Revision 1.31  2010/11/09 15:17:00  bruno
# make meta rolls
#
# Revision 1.30  2010/09/07 23:52:45  bruno
# star power for gb
#
# Revision 1.29  2010/06/22 21:31:38  mjk
# fix ROCKSROOT to base roll
#
# Revision 1.28  2009/05/01 19:06:46  mjk
# chimi con queso
#
# Revision 1.27  2008/10/18 00:55:43  mjk
# copyright 5.1
#
# Revision 1.26  2008/03/06 23:41:29  mjk
# copyright storm on
#
# Revision 1.25  2008/02/01 21:32:57  mjk
# killed meta roll code
#
# Revision 1.24  2007/06/23 04:03:16  mjk
# mars hill copyright
#
# Revision 1.23  2007/05/10 20:37:00  mjk
# - massive rocks-command changes
# -- list host is standardized
# -- usage simpler
# -- help is the docstring
# -- host groups and select statements
# - added viz commands
#
# Revision 1.22  2006/12/06 00:23:28  anoop
# $(MAKE) instead of gmake or make
#
# Revision 1.21  2006/09/11 22:46:52  mjk
# monkey face copyright
#
# Revision 1.20  2006/08/10 17:30:53  bruno
# new set of meta rolls
#
# Revision 1.19  2006/08/10 00:09:14  mjk
# 4.2 copyright
#
# Revision 1.18  2005/10/12 18:08:21  mjk
# final copyright for 4.1
#
# Revision 1.17  2005/09/16 01:02:01  mjk
# updated copyright
#
# Revision 1.16  2005/08/25 18:56:16  mjk
# *** empty log message ***
#
# Revision 1.15  2005/06/08 03:17:44  bruno
# make the viz meta roll too
#
# Revision 1.14  2005/06/07 20:46:19  mjk
# typo
#
# Revision 1.13  2005/06/07 20:40:09  mjk
# update roll target
#
# Revision 1.12  2005/06/03 07:18:05  bruno
# support for the everything roll
#
# Revision 1.11  2005/06/01 01:12:30  mjk
# added meta for KU
#
# Revision 1.10  2005/05/27 17:54:40  mjk
# build metas
#
# Revision 1.8  2005/03/04 01:40:02  mjk
# massive graph cleanup
#
# Revision 1.7  2005/02/23 21:49:23  mjk
# *** empty log message ***
#
# Revision 1.6  2004/12/22 03:15:25  bruno
# makefile cleanup -- now can actually do a 'make clean' that will tidy up
# all the rolls
#
# Revision 1.5  2004/01/30 04:58:00  mjk
# added graph target
#
# Revision 1.4  2003/07/22 22:01:42  bruno
# changes for roll building
#
# Revision 1.3  2003/07/12 00:49:40  bruno
# nuke before iso building
#
# Revision 1.2  2003/07/11 23:55:08  bruno
# touchup on the rolls
#
# Revision 1.1  2003/07/07 20:47:51  bruno
# initial release
#
#
#

ROCKSROOT = base/src/devel/devel
-include $(ROCKSROOT)/etc/Rules.mk
include Rules.mk

default: roll

roll upload clean nuke::
	for i in $(ROLLS) ; do \
		(cd $$i; $(MAKE) $@) ; \
	done

metarolls:
	# core roll
	rocks create roll area51/*iso base/*iso ganglia/*iso hpc/*iso \
		sge/*iso web-server/*iso xen/*iso
	# jumbo roll
	rocks create roll */*disk[12].iso
