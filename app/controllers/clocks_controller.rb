class ClocksController < ApplicationController
  def new    
  	@jobs = Job.where(completed: false)
    @clocks = Clock.where(user: current_user)
    @others = Clock.where.not(user: current_user) 
    @lastclock = @clocks.last 
  end
  def edit
    @clock = Clock.find_by(id: params[:id])
    @jobs = Job.all
  end

  def clockin
  	@clock = Clock.create(clock_params)
    if @clock.valid?
      redirect_to "/home", alert: "Clocked In"
    else
      flash[:errors] = @clock.errors.full_messages
      redirect_to "/home"
    end
  end
  def update
    @clock = Clock.find_by(id: params[:id])
    if @clock.update(update_clock)
      redirect_to "/home", alert: "Clocked Out"
    else
      flash[:errors] = @clock.errors.full_messages
      redirect_to "/home"
    end
  end

  def clockout
    @clock = Clock.find_by(user: current_user, clockedin: true)
    puts "THIS IS THE CLOCK AND It does ROCK #{@clock.user.first}"
    @clock.clockedin = false;
    if @clock.save   
      time = @clock.updated_at - @clock.created_at
      puts "WHATS THE TIME??!!! ITS TIME TO GET #{time}"
      time = time / 60
      puts "WHATS THE TIME??!!! ITS TIME TO GET #{time}"
      @clock.time = time
      puts "WHATS THE TIME??!!! ITS TIME TO GET #{@clock.time}"
      if @clock.save
        redirect_to "/home", alert: "Clocked Out"
      else
        flash[:errors] = @clock.errors.full_messages
        redirect_to "/home"
      end
    else
      flash[:errors] = @clock.errors.full_messages
      redirect_to "/home"
    end

    # else
    #   flash[:errors] = @clock.errors.full_messages
    #   redirect_to "/home"
    # end
  end
   # time = (Time.now() - @clock.created_at).to_s
  def index
    @users = User.all
  end
  private
  def clock_params
  	params.require(:clock).permit(:job_id).merge(user: current_user, clockedin: true)
  end
  def update_clock
    params.require(:clock).permit(:job_id, :user, :time).merge(clockedin: false)
  end
end
