/*
 * Sentilo
 *  
 * Original version 1.4 Copyright (C) 2013 Institut Municipal d’Informàtica, Ajuntament de Barcelona.
 * Modified by Opentrends adding support for multitenant deployments and SaaS. Modifications on version 1.5 Copyright (C) 2015 Opentrends Solucions i Sistemes, S.L.
 * 
 *   
 * This program is licensed and may be used, modified and redistributed under the
 * terms  of the European Public License (EUPL), either version 1.1 or (at your 
 * option) any later version as soon as they are approved by the European 
 * Commission.
 *   
 * Alternatively, you may redistribute and/or modify this program under the terms
 * of the GNU Lesser General Public License as published by the Free Software 
 * Foundation; either  version 3 of the License, or (at your option) any later 
 * version. 
 *   
 * Unless required by applicable law or agreed to in writing, software distributed
 * under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR 
 * CONDITIONS OF ANY KIND, either express or implied. 
 *   
 * See the licenses for the specific language governing permissions, limitations 
 * and more details.
 *   
 * You should have received a copy of the EUPL1.1 and the LGPLv3 licenses along 
 * with this program; if not, you may find them at: 
 *   
 *   https://joinup.ec.europa.eu/software/page/eupl/licence-eupl
 *   http://www.gnu.org/licenses/ 
 *   and 
 *   https://www.gnu.org/licenses/lgpl.txt
 */
package org.sentilo.web.catalog.service;

import java.util.List;
import java.util.Set;

import org.sentilo.web.catalog.domain.ComponentType;

public interface ComponentTypesService extends CrudService<ComponentType> {

  void insertNewComponentTypesIfNotExists(Set<String> componentTypes);

  /**
   * Return a list of component types where for each element there exist a component with this type
   *
   * @param onlyPublics If list must shows only component types related to public components.
   * @return
   */
  List<ComponentType> getActiveComponentTypes(boolean onlyPublics);

  /**
   * Return a list of types of component according to provider components
   *
   * @param providerId The provider id. If null, then return all component types
   * @return List<ComponentType>
   */
  List<ComponentType> findComponentTypesByProvider(String providerId);
}
