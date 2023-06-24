---
layout: post
title: "Accelerate - Nicole Forsgren PhD, Jez Humble and Gene Kim"
date: 2023-04-20 09:00:00 +1000
tags: book, organizations
---

Perhaps by good fortune, I have had the pleasure working for some amazing companies over the years that have
incorporated many of the indicators that high performing organizations possess and that I now know in formal
detail, having read Accelerate by Nicole Forsgren PhD, Jez Humble and Gene Kim.

Although starting to fell a little dated in 2023, it is still a must read classic for anyone working in IT or
Software Engineering.

Here are some of my notes.

# Chapter 2: Measuring Performance

- We measured product delivery lead time as the time it takes to go from code committed to code successfully running
  in production.

- Table 2.3 Software Delivery Performance for 2017 - High Performers:

  - Deployment Frequency - On demand (multiple deploys per day).
  - Lead Time For Changes - Less than one hour.
  - MTTR - Less than one hour.
  - Change Failure Rate - 0 - 15%.

- These results demonstrate that there is no trade-off between improving performance and achieving higher level of
  stability and quality. Rather, higher performers do better at all of these.
- As Deming said, ‘Whenever there is fear, you get the wrong numbers.’

# Chapter 3: Measuring and Changing Culture

- Figure 3.1: Likert-Type Questions for Measuring Culture
- Strongly disagree, Disagree, Somewhat disagree, Neither agree nor disagree, Somewhat agree, Agree, Strongly agree
  - Information actively sought?
  - Messengers are not punished when they deliver news of failures or other bad news?
  - Responsibilities are shared?
  - Cross-functional collaboration is encouraged and rewarded?
  - Failure causes inquiry?
  - New ideas are welcomed?
  - Failures are treated primarily as opportunities to improve the system?
- How organisations deal with failures or accidents is particularly instructive. Pathological organisations look for a
  ‘throat to choke’.
- Investigations aim to find the person or persons responsible for the problem, and then punish or blame them.
- Failure in complex systems is, like all other types of behaviour in such systems, emergent.
- Thus, accident investigations that stop at ‘human error’ are not just bad but dangerous.

# Chapter 5: Architecture

- The fact that low performers were more likely to be using - or integrating against - custom software developed by
  another company underlines the importance of bring this capability in-house.
- The ‘inverse Conway Manoeuvre’, which states that organisation should evolve their team and organisational structure
  to achieve the desired architecture.
- The goal is for for your architecture to support support the ability of teams to get their work done - from design
  through to deployment - without requiring high-bandwidth communication between teams.
- Architecture approaches that support this: bounded contexts, APIs, containerisation.

# Chapter 11: Leaders and Managers

- The five characteristics of transformational leaders are:
- Vision
  - Has a clear understanding of where we are going?
  - Has a clear sense of where he/she wants our team to be in five years.
  - Has a clear idea of where the organisation is going.
- Inspiring communication
  - Says things that make employees proud to be part of the organisation.
  - Says positive things about the work unit.
  - Encourages people to see changing environments as situations full of opportunities.
- Intellectual stimulation
  - Challenges me to think about old problems in new ways.
  - Has ideas that have forced me to rethink some things that I have never questioned before.
  - Has challenged me to rethink some of my basic assumptions about my work.
- Supportive leadership
- Personal recognition
- Hold regular interval DevOps mini-conferences. We’ve seen organisations achieve success using the classic DevOpsDays
  format, which combines pre-prepared talks with “open spaces” where participants self-organise to propose and facilitate
  their own sessions.
