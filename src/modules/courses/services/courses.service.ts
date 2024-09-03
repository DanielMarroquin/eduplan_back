import { Injectable } from "@nestjs/common";
import { Repository } from "typeorm";
import { Curso } from "../common/entities/courses.entity";
import { InjectRepository } from "@nestjs/typeorm";


@Injectable()
export class CoursesService {
    constructor(
        @InjectRepository(Curso)
        private readonly coursesRepository: Repository<Curso>

    ) {
    }

    async findAll(): Promise<Curso[]> {
        return this.coursesRepository.find({ where: { status: 1 } });
    }


    async findOne(id: number): Promise<Curso> {
        return await this.coursesRepository.findOne({ where: { id } });
    }



    async create(createAlumnoDto: any): Promise<Curso[]> {
        const newCourse = this.coursesRepository.create(createAlumnoDto);
        return await this.coursesRepository.save(newCourse);
    }

    async update(id: number, updateAlumnoDto: any): Promise<Curso> {
        await this.coursesRepository.update(id, updateAlumnoDto);
        return this.findOne(id);
    }


    async deleteCourse(id: number): Promise<void> {
        const data = await this.coursesRepository.findOneBy({ id });

        if (!data) {
            throw new Error('Student not found');
        }

        data.status = 0;
        await this.coursesRepository.save(data);
    }


}
