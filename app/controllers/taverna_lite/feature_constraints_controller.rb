# Copyright (c) 2012-2013 Cardiff University, UK.
# Copyright (c) 2012-2013 The University of Manchester, UK.
#
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#
# * Redistributions of source code must retain the above copyright notice,
#   this list of conditions and the following disclaimer.
#
# * Redistributions in binary form must reproduce the above copyright notice,
#   this list of conditions and the following disclaimer in the documentation
#   and/or other materials provided with the distribution.
#
# * Neither the names of The University of Manchester nor Cardiff University nor
#   the names of its contributors may be used to endorse or promote products
#   derived from this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
# ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
# LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
# CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
# SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
# INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
# CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
# ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
# POSSIBILITY OF SUCH DAMAGE.
#
# Authors
#     Abraham Nieva de la Hidalga
#
# Synopsis
#
# BioVeL Taverna Lite is a prototype interface provided to support the
# inspection and modification of workflows.
#
# For more details see http://www.biovel.eu
#
# BioVeL is funded by the European Commission 7th Framework Programme (FP7),
# through the grant agreement number 283359.
require_dependency "taverna_lite/application_controller"

module TavernaLite
  class FeatureConstraintsController < ApplicationController
    # GET /feature_constraints
    # GET /feature_constraints.json
    def index
      @feature_constraints = FeatureConstraint.all

      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @feature_constraints }
      end
    end

    # GET /feature_constraints/1
    # GET /feature_constraints/1.json
    def show
      @feature_constraint = FeatureConstraint.find(params[:id])

      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @feature_constraint }
      end
    end

    # GET /feature_constraints/new
    # GET /feature_constraints/new.json
    def new
      @feature_constraint = FeatureConstraint.new

      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @feature_constraint }
      end
    end

    # GET /feature_constraints/1/edit
    def edit
      @feature_constraint = FeatureConstraint.find(params[:id])
    end

    # POST /feature_constraints
    # POST /feature_constraints.json
    def create
      @feature_constraint = FeatureConstraint.new(params[:feature_constraint])

      respond_to do |format|
        if @feature_constraint.save
          format.html { redirect_to @feature_constraint, notice: 'Feature constraint was successfully created.' }
          format.json { render json: @feature_constraint, status: :created, location: @feature_constraint }
        else
          format.html { render action: "new" }
          format.json { render json: @feature_constraint.errors, status: :unprocessable_entity }
        end
      end
    end

    # PUT /feature_constraints/1
    # PUT /feature_constraints/1.json
    def update
      @feature_constraint = FeatureConstraint.find(params[:id])

      respond_to do |format|
        if @feature_constraint.update_attributes(params[:feature_constraint])
          format.html { redirect_to @feature_constraint, notice: 'Feature constraint was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @feature_constraint.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /feature_constraints/1
    # DELETE /feature_constraints/1.json
    def destroy
      @feature_constraint = FeatureConstraint.find(params[:id])
      @feature_constraint.destroy

      respond_to do |format|
        format.html { redirect_to feature_constraints_url }
        format.json { head :no_content }
      end
    end
  end
end