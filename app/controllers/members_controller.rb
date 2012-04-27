class MembersController < ApplicationController
  # GET /members
  # GET /members.json
  def index
    @members = Member.where('true').order(params[:order_by])
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @members }
    end
  end

  # GET /members/1
  # GET /members/1.json
  def show
    @member = Member.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @member }
    end
  end

  # GET /members/new
  # GET /members/new.json
  def new
    @member = Member.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @member }
    end
  end

  # GET /members/1/edit
  def edit
    @member = Member.find(params[:id])
  end

  # POST /members
  # POST /members.json
  def create
    @member = Member.new(params[:member])

    respond_to do |format|
      if @member.save
        format.html { redirect_to @member, notice: 'Member was successfully created.' }
        format.json { render json: @member, status: :created, location: @member }
      else
        format.html { render action: "new" }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /members/1
  # PUT /members/1.json
  def update
    @member = Member.find(params[:id])
    respond_to do |format|
      if !params[:member][:image_link].nil?
        @member.save_image(params[:member])
      end
      if @member.update_attributes params[:member]

        format.html { redirect_to @member, notice: 'Member was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /members/1
  # DELETE /members/1.json
  def destroy
    @member = Member.find(params[:id])
    @member.destroy

    respond_to do |format|
      format.html { redirect_to members_url }
      format.json { head :no_content }
    end
  end

  # GET /members/search
  def search
    @members = Member.where('name like :s or nick like :s', :s => '%%' + params[:s] + '%%').order(params[:order_by])
  end

  # GET /members/advanced_search
  def advanced_search
    if !params.empty?
      query = Array.new
      if !params[:name].nil? and !params[:name].empty?
        query.append 'name like :name'
      end
      if !params[:nick].nil? and !params[:nick].empty?
        query.append 'nick like :nick'
      end
      if !params[:email].nil? and !params[:email].empty?
        query.append 'email like :email'
      end
      if !params[:introduction].nil? and !params[:introduction].empty?
        query.append 'introduction like :introduction'
      end
      if !params[:introduction].nil? and !params[:positions].empty?
        query.append 'positions like :positions'
      end
      if !params[:is_senior].nil?
        query.append 'is_senior = 1'
      end

      if !query.empty?
        @members = Member.where(query.join(' and '), :name => '%%' + params[:name] + '%%', :nick => '%%' + params[:nick] + '%%', :email => '%%' + params[:email] + '%%', :positions => '%%' + params[:positions] + '%%', :introduction => '%%' + params[:introduction] + '%%').order(params[:order_by])
      else
        @members = []
      end
    end
  end
end
