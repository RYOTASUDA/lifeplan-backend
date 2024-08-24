# frozen_string_literal: true

namespace :ridgepole do
  desc 'ridgepole --apply'
  task apply: :environment do
    ridgepole!('--apply')
    Rake::Task['db:schema:dump'].invoke
  end

  desc 'ridgepole --apply --drop-table'
  task apply_and_drop_table: :environment do
    ridgepole!('--apply --drop-table')
    Rake::Task['db:schema:dump'].invoke
  end

  desc 'ridgepole --dry-run --apply'
  task dry_run_apply: :environment do
    ridgepole!('--dry-run --apply')
  end

  private

  def schemafile
    Rails.root.join('Schemafile')
  end

  def configfile
    Rails.root.join('config/database.yml')
  end

  def ridgepole!(*args)
    options.each do |option|
      system "bundle exec ridgepole #{[option + args].join(' ')}"
    end
  end

  def options
    common_options = [
      ["-E #{Rails.env}", "-c #{configfile}", "-f #{schemafile}", '--bulk-change']
    ]
    return common_options unless Rails.env.development?

    common_options.push ['-E test', "-c #{configfile}", "-f #{schemafile}", '--bulk-change']
  end
end
