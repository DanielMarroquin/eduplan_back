import { Injectable, NotFoundException } from "@nestjs/common";
import { InjectRepository } from "@nestjs/typeorm";
import { Alumno } from '../common/entities/students.entity'
import { Repository } from "typeorm";

@Injectable()
export class StudentsService {
    constructor(
        @InjectRepository(Alumno)
        private studentsRepository: Repository<Alumno>
    ) {
    }

    async findAll(): Promise<Alumno[]> {
        return this.studentsRepository.find({ where: { status: 1 } });
    }



    async findOne(id: number): Promise<Alumno> {
        return await this.studentsRepository.findOne({ where: { id } });
    }

    async create(createAlumnoDto: any): Promise<Alumno[]> {
        const newAlumno = this.studentsRepository.create(createAlumnoDto);
        return await this.studentsRepository.save(newAlumno);
    }

    async update(id: number, updateAlumnoDto: any): Promise<Alumno> {
        await this.studentsRepository.update(id, updateAlumnoDto);
        return this.findOne(id);
    }

    async deleteStudent(id: number): Promise<void> {
        const student = await this.studentsRepository.findOneBy({ id });

        if (!student) {
            throw new Error('Student not found');
        }

        student.status = 0;
        await this.studentsRepository.save(student);
    }






}
