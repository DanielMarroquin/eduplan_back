import { Injectable } from "@nestjs/common";
import { InjectRepository } from "@nestjs/typeorm";
import { Evaluacion } from "../common/entities/evaluations.entity";
import { Repository } from "typeorm";


@Injectable()
export class EvaluationsService {
    constructor(
        @InjectRepository(Evaluacion)
        private evaluationsRepository: Repository<Evaluacion>
    ) {
    }


    async findAll(): Promise<Evaluacion[]> {
        return this.evaluationsRepository.find();
    }

    async findOne(id: number): Promise<Evaluacion> {
        return await this.evaluationsRepository.findOne({ where: { id } });
    }


    async create(createAlumnoDto: any): Promise<Evaluacion[]> {
        const newEvaluation = this.evaluationsRepository.create(createAlumnoDto);
        return await this.evaluationsRepository.save(newEvaluation);
    }


    async deleteC(id: number): Promise<void> {
        const course = await this.evaluationsRepository.findOneBy({ id });

        if (!course) {
            throw new Error('Student not found');
        }

        // course.status = 0;
        await this.evaluationsRepository.save(course);
    }

}
