# $Id: Makefile,v 1.32 2012/11/27 00:47:49 phil Exp $
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
# Revision 1.32  2012/11/27 00:47:49  phil
# Copyright Storm for Emerald Boa
#
# Revision 1.31  2012/05/06 05:52:01  phil
# Copyright update for Mamba
#
# Revision 1.30  2010/09/07 23:52:44  bruno
# star power for gb
#
# Revision 1.29  2010/06/22 21:34:09  mjk
# get rocks-version.mk from base roll
#
# Revision 1.28  2009/05/01 19:06:45  mjk
# chimi con queso
#
# Revision 1.27  2008/10/18 00:55:43  mjk
# copyright 5.1
#
# Revision 1.26  2008/03/06 23:41:28  mjk
# copyright storm on
#
# Revision 1.25  2008/02/14 21:33:32  mjk
# added hg path
#
# Revision 1.24  2008/02/04 20:03:39  mjk
# bzr
#
# Revision 1.23  2008/01/30 02:28:10  mjk
# hg support (exploring)
#
# Revision 1.22  2007/08/01 17:09:24  mjk
# not just bruno
#
# Revision 1.21  2007/07/06 20:27:50  bruno
# new tag
#
# Revision 1.20  2007/06/23 04:03:16  mjk
# mars hill copyright
#
# Revision 1.19  2006/12/04 22:05:48  bruno
# lights-out tweak
#
# Revision 1.18  2006/09/11 22:46:51  mjk
# monkey face copyright
#
# Revision 1.17  2006/08/10 00:09:12  mjk
# 4.2 copyright
#
# Revision 1.16  2006/03/06 22:36:57  mjk
# *** empty log message ***
#
# Revision 1.15  2006/03/06 22:35:12  mjk
# *** empty log message ***
#
# Revision 1.14  2006/01/20 17:20:19  mjk
# *** empty log message ***
#
# Revision 1.13  2005/10/12 18:08:18  mjk
# final copyright for 4.1
#
# Revision 1.12  2005/10/05 18:40:40  bruno
# added ROCKS_TAG variable
#
# Revision 1.11  2005/09/16 01:01:52  mjk
# updated copyright
#
# Revision 1.10  2004/10/20 05:40:24  bruno
# tag it 'n' bag it
#
# Revision 1.9  2004/08/20 22:44:55  bruno
# a test message to see if this can fix bug 4.
#
# Revision 1.8  2004/05/22 15:15:49  bruno
# updated tag
#
# Revision 1.7  2004/02/11 22:08:00  bruno
# old commits that should have been done when 3.1.0 came out
#
# Revision 1.6  2003/09/03 23:37:12  bruno
# update for 3.0.0
#
# Revision 1.5  2003/04/01 02:12:26  bruno
# updated tag
#
# Revision 1.4  2003/02/17 18:47:01  bruno
# new tag for 2.3.1
#
# Revision 1.3  2002/11/12 22:25:40  bruno
# added 'tag' directive
#
# Revision 1.2  2002/10/18 21:33:25  mjk
# Rocks 2.3 Copyright
#
# Revision 1.1  2002/10/18 19:20:11  mjk
# Support for multiple mirrors
# Fixed insert-copyright for new CVS layout
#

HG=/opt/rocks/bin/hg

include src/roll/base/src/devel/devel/etc/rocks-version.mk

default:

tag:
	cvs -d $(USER)@fyp.rocksclusters.org:/home/cvs/CVSROOT tag $(ROCKS_TAG)

clean::
	for i in redhat src tmp; do \
		(cd $$i; make $@) ; \
	done

.hg:
	$(HG) init .

.bzr:
	bzr init

.PHONY: hg
hg: .hg
	$(HG) addremove
	$(HG) commit -m "cvs update"

.PHONY: bzr
bzr: .bzr
	bzr add
	bzr commit -m "cvs update"

