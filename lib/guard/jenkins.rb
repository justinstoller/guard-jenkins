require 'guard'
require 'guard/guard'
require 'nokogiri'

module Guard
  class Jenkins < Guard

    def initialize( watchers=[], options={} )
      super

      @jenkins_path = options[:jenkins].nil? ? '/var/lib/jenkins/' : options[:jenkins]
      @skip_check = options[:skip_check].nil? ? false : true
      @fail_img = options[:fail_img].nil? ? @jenkins_path + 'userContent/images/fail.png' : options[:fail_img]
      @success_img = options[:success_img].nil? ? @jenkins_path + 'userContent/images/success.png' : options[:success_img]
    end

    def start
      check_present_jobs unless @skip_check
    end

    def stop
      true
    end

    def reload
      check_present_jobs
    end

    def run_all
      true
    end

    def run_on_change( paths=[] )
      update_status_for paths
    end

    def check_present_jobs
      job_names.each do |job|
        if success? job
          link_success_img_for job
        else
          link_fail_img_for job
        end
      end
    end

    def update_status_for( paths=[] )

    end

    def job_names
      puts 'JOB NAMES WAS CALLED!'
      names = Dir.new(@jenkins_path + 'jobs')
      names = names.reject {|dir| dir == '.' }
      names = names.reject {|dir| dir == '..' }
      names
    end

    def last_success_file(job_name)
      if File.exists?( @jenkins_path + 'jobs/' + job_name + '/lastSuccessful/build.xml' )
        File.new( @jenkins_path + 'jobs/' + job_name +
                 '/lastSuccessful/build.xml' )
      else
        false
      end
    end

    def next_build_num(job_name)
      nbn_file = File.new( @jenkins_path + 'jobs/' +
                          job_name + '/nextBuildNumber' )
      nbn_file.gets.strip.to_i
    end

    def last_success_num(build_file)
      if build_file
        doc = Nokogiri::XML build_file
        doc.at_xpath('/build/number').text.to_i
      else
        0
      end
    end

    def current_build_num(job_name)
      next_build_num(job_name) - 1
    end

    def success?(job_name)
      file = last_success_file(job_name)
      if last_success_num(file) == current_build_num(job_name)
        return true
      else
        return false
      end
    end

    def ensure_dir_for(job_name)
      unless Dir.new(@jenkins_path + 'userContent/jobs').include? job_name
        Dir.mkdir(@jenkins_path + 'userContent/jobs/' + job_name)
      end
    end

    def link_success_img_for(job_name)
      current_status = @jenkins_path + 'userContent/jobs/' + job_name + '/current_status.png'
      ensure_dir_for job_name
      if File.exists? current_status
        File.delete current_status
      end
      File.symlink( @success_img, current_status )
    end

    def link_fail_img_for(job_name)
      current_status = @jenkins_path + 'userContent/jobs/' + job_name + '/current_status.png'
      ensure_dir_for job_name
      if File.exists? current_status
        File.delete current_status
      end
      File.symlink( @fail_img, current_status )
    end
  end
end
