# $Id: Makefile,v 1.28 2012/11/27 00:47:49 phil Exp $
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
# Revision 1.28  2012/11/27 00:47:49  phil
# Copyright Storm for Emerald Boa
#
# Revision 1.27  2012/05/06 05:52:01  phil
# Copyright update for Mamba
#
# Revision 1.26  2010/09/07 23:52:45  bruno
# star power for gb
#
# Revision 1.25  2009/05/01 19:06:46  mjk
# chimi con queso
#
# Revision 1.24  2008/10/18 00:55:43  mjk
# copyright 5.1
#
# Revision 1.23  2008/03/06 23:41:29  mjk
# copyright storm on
#
# Revision 1.22  2007/06/23 04:03:16  mjk
# mars hill copyright
#
# Revision 1.21  2006/09/11 22:46:52  mjk
# monkey face copyright
#
# Revision 1.20  2006/08/10 00:09:14  mjk
# 4.2 copyright
#
# Revision 1.19  2005/10/12 18:08:21  mjk
# final copyright for 4.1
#
# Revision 1.18  2005/09/16 01:02:01  mjk
# updated copyright
#
# Revision 1.17  2005/08/25 18:56:18  mjk
# *** empty log message ***
#
# Revision 1.16  2002/10/18 21:33:25  mjk
# Rocks 2.3 Copyright
#
# Revision 1.15  2002/10/07 02:04:41  mjk
# fixed recursion
#
# Revision 1.15  2002/10/04 19:41:00  mjk
# *** empty log message ***
#
# Revision 1.14  2002/10/03 23:06:08  mjk
# futzed with CVS repository structure
#
# Revision 1.13  2002/02/21 21:33:27  bruno
# added new copyright
#
# Revision 1.12  2001/07/28 23:30:19  bruno
# took out 'mvia'
#
# Revision 1.11  2001/05/11 21:26:21  bruno
# make sure 'gm' is first
#
# Revision 1.10  2001/05/09 20:17:09  bruno
# bumped copyright 2.1
#
# Revision 1.9  2001/04/10 14:16:25  bruno
# updated copyright
#
# Revision 1.8  2001/02/26 04:56:56  bruno
# took out servernet build, you know, 'cause it kinda sucks.
#
# Revision 1.7  2001/02/14 20:16:27  mjk
# Release 2.0 Copyright
#
# Revision 1.6  2000/11/28 20:46:34  mjk
# Added some manpages, and some minor Rule.mk changes that hit all the
# Makefiles.
#
# Revision 1.5  2000/11/17 00:47:03  mjk
# Changed find command again
#
# Revision 1.4  2000/07/07 22:31:28  mjk
# Collapsed rpm/clean into on rule
#
# Revision 1.3  2000/07/07 22:25:19  bruno
# cleanup and added a 'clean' target
#
# Revision 1.2  2000/07/07 22:13:39  bruno
# fix - need a 'cd ..' after make rpm
#
# Revision 1.1  2000/07/07 22:11:09  bruno
# initial release
#
#

SRCDIRS = `find . -type d -name '[a-z]*' -maxdepth 1`

default:	rpm

rpm clean::
	for i in $(SRCDIRS) ; do \
		(cd $$i; make $@) ; \
	done

