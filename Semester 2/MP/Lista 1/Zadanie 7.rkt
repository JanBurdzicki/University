#lang racket

(require 2htdp/image)
(require 2htdp/universe)

(define rocket .)

(define scene-width 150)
(define scene-height 1000)
(define rocket-x (/ scene-width 2))

(define scene (empty-scene scene-width scene-height))

(define rocket-v 3)
(define rocket-a 0.2)
(define number_of_seconds_before_start 3)

(define (pow_2 a)
	(* a a))

(define (scene-with-rocket rocket-y)
	(place-image rocket rocket-x rocket-y scene))

(define (count_down x)
	(place-image(text(number->string x) 50 "black")
	(/ scene-width 2)
	(/ scene-height 2)
	scene))

(define start_position
	(- scene-height(/ (image-height rocket) 2)))

(define how_fast_time_pass 25)

(define (t_after_countdown t)
	(- t (* number_of_seconds_before_start how_fast_time_pass)))

(define (animation_of_start t)
	(define distance (- start_position (* rocket-a (pow_2 (t_after_countdown t)))))
	(if (< t (* number_of_seconds_before_start how_fast_time_pass))
		(count_down (- number_of_seconds_before_start (round(/ t how_fast_time_pass))))
		(scene-with-rocket distance)))

(animate animation_of_start)